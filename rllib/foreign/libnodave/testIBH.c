/*
 Test and demo program for Libnodave, a free communication libray for Siemens S7.
 
 **********************************************************************
 * WARNING: This and other test programs overwrite data in your PLC.  *
 * DO NOT use it on PLC's when anything is connected to their outputs.*
 * This is alpha software. Use entirely on your own risk.             * 
 **********************************************************************
 
 (C) Thomas Hergenhahn (thomas.hergenhahn@web.de) 2002, 2003.

 This is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2, or (at your option)
 any later version.

 This is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with Libnodave; see the file COPYING.  If not, write to
 the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.  
*/
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "nodave.h"
#include "openSocket.h"

#ifdef LINUX
#include <unistd.h>
#include <sys/time.h>
#include <fcntl.h>
#define UNIX_STYLE
#endif

#ifdef CYGWIN
#include <unistd.h>
#include <sys/time.h>
#include <fcntl.h>
#define UNIX_STYLE
#endif

#ifdef BCCWIN
#include <time.h>
    void usage(void);
    void wait(void);
#define WIN_STYLE    
#endif

void usage()
{
    printf("Usage: testIBH [-d] [-w] IP address.\n");
    printf("-w will try to write to Flag words. It will overwrite FB0 to FB15 (MB0 to MB15) !\n");
    printf("-d will produce a lot of debug messages.\n");
    printf("-b will run benchmarks. Specify -b and -w to run write benchmarks.\n");
    printf("-z will read some SZL list items (diagnostic information).\n");
    printf("-l will run a test to determine maximum length of a block in read.\n");
    printf("-m will run a test for multiple variable reads.\n");
    printf("-c will write 0 to the PLC memory used in write tests.\n");
    printf("-n will test newly added functions.\n");
    printf("-a will read out everything from system state lists(SZLs).\n");
    printf("-s stops the PLC.\n");
    printf("-r tries to put the PLC in run mode.\n");
    printf("-<number> will set the speed of MPI/PROFIBUS network to this value (in kBaud).\n  Default is 187.\n  Supported values are 9, 19, 45, 93, 187, 500 and 1500.\n");
    printf("--mpi=<number> will use number as the MPI adddres of the PLC. Default is 2.\n");
    printf("--local=<number> will set the local MPI adddres to number. Default is 0.\n");
    printf("--readout read program and data blocks from PLC.\n");
    printf("--readoutall read all program and data blocks from PLC. Includes SFBs and SFCs.\n");
    printf("--debug=<number> will set daveDebug to number.\n");
    printf("Example: testIBH -w 192.168.1.1\n");
}

void wait() {
    uc c;
#ifdef UNIX_STYLE
    printf("Press return to continue.\n");
    read(0,&c,1);
#endif    
//#ifdef WIN_STYLE
//    printf("Press return to continue.\n");
//    scanf("\n");  //somebody else will find out how to read a single CR in win32...
//#endif    
}    

void readSZL(daveConnection *dc,int id, int index) {
    int res, SZLid, indx, SZcount, SZlen,i,j,len;
    uc * d,*dd;
    uc ddd[3000];
    printf("Trying to read SZL-ID %04X index %02X.\n",id,index);
    res=daveReadSZL(dc,id,index, ddd);
    printf("Function result: %d %s len:%d\n",res,daveStrerror(res),dc->AnswLen);
//    _daveDump("Data",ddd,dc->AnswLen);
    
    if ((dc->AnswLen)>=4) {
	d=ddd;
        dd=ddd;
	dd+=8;
	len=dc->AnswLen-8;
	SZLid=0x100*d[0]+d[1]; 
        indx=0x100*d[2]+d[3]; 
	printf("result SZL ID %04X %02X \n",SZLid,indx);
    
	if ((dc->AnswLen)>=8) {
    	    SZlen=0x100*d[4]+d[5]; 
    	    SZcount=0x100*d[6]+d[7]; 
	    printf("%d elements of %d bytes\n",SZcount,SZlen);
	    if(len>0){
	    for (i=0;i<SZcount;i++){
		if(len>0){
		for (j=0; j<SZlen; j++){
		    if(len>0){
		    printf("%02X,",*dd);
		    dd++;
		    }
		    len--;
		}
		printf("\n");
		}
	    }
	    }
	}
    }
    printf("\n");
}    
	
void readSZLAll(daveConnection *dc) {
    uc SzlList[1000];
    int res, SZLid, indx, SZcount, SZlen,i,j, rid, rind;
    uc * d,*dd;
    
    res=daveReadSZL(dc,0,0,SzlList);
    printf("%d %d\n",res,dc->AnswLen);
    if ((dc->AnswLen)>=4) {
	d=dc->resultPointer;
        dd=SzlList;
	dd+=8;
	SZLid=0x100*d[0]+d[1]; 
        indx=0x100*d[2]+d[3]; 
	printf("result SZL ID %04X %02X \n",SZLid,indx);
    
	if ((dc->AnswLen)>=8) {
    	    SZlen=0x100*d[4]+d[5]; 
    	    SZcount=0x100*d[6]+d[7]; 
	    printf("%d elements of %d bytes\n",SZcount,SZlen);
	    for (i=0;i<SZcount;i++){
		rid=*(dd+1); 
		rid=*(dd+1)+256*(*dd); 
		rind=0;

		printf("\nID:%04X Index:%02X\n",rid,rind);
		readSZL(dc, rid, rind);
		for (j=0; j<SZlen; j++){
		    printf("%02X,",*dd);
		    dd++;
		}
		printf("\nID:%04X Index:%02X\n",rid,rind);
		
	    }
	}
    }
    printf("\n");
}

void loadBlocksOfType(daveConnection * dc, int blockType) {
    int j, i, uploadID, len, more;
#ifdef UNIX_STYLE
    int fd;
#endif	        
#ifdef WIN_STYLE	    
    HANDLE fd;
    unsigned long res;
#endif	        
    char blockName [20];
    uc blockBuffer[20000],*bb;
    daveBlockEntry dbe[256];   
    j=daveListBlocksOfType(dc, blockType, dbe);
    printf("%d blocks of type %s\n",j,daveBlockName(blockType));
    for (i=0; i<j; i++) {
	printf("%s%d  %d %d\n",
	    daveBlockName(blockType),
	    dbe[i].number, dbe[i].type[0],dbe[i].type[1]);	
	bb=blockBuffer;
	len=0;
	if (0==initUpload(dc, blockType, dbe[i].number, &uploadID)) {
    	    do {
		doUpload(dc,&more,&bb,&len,uploadID);
	    } while (more);
	    sprintf(blockName,"%s%d.mc7",daveBlockName(blockType), dbe[i].number);	
#ifdef UNIX_STYLE
    	    fd=open(blockName,O_RDWR|O_CREAT|O_TRUNC,0644);
    	    write(fd, blockBuffer, len);
    	    close(fd);
#endif	    
#ifdef WIN_STYLE
	    fd = CreateFile(blockName,
    	      GENERIC_WRITE, 0, 0, 2,
    		FILE_FLAG_WRITE_THROUGH, 0);
    	    WriteFile(fd, blockBuffer, len, &res, NULL);
    	    CloseHandle(fd);
#endif	    
    	    endUpload(dc,uploadID);
	}    
    }
}


#include "benchmark.c"

int main(int argc, char **argv) {
    int i,j, a,b,c, adrPos, doWrite, doBenchmark, 
	doSZLread, doMultiple, doClear, doNewfunctions, doWbit,
	initSuccess, doSZLreadAll, doRun, doStop, doReadout, doSFBandSFC,
	saveDebug,
	res, useProto, speed, localMPI, plcMPI, wbit;
    PDU p;	
    float d;
    char buf1 [davePartnerListSize];
    daveInterface * di;
    daveConnection * dc;
    _daveOSserialType fds;
    daveResultSet rs;
    
    adrPos=1;
    doWrite=0;
    doBenchmark=0;
    doSZLread=0;
    doSZLreadAll=0;
    doMultiple=0;
    doClear=0;
    doNewfunctions=0;
    doWbit=0;
    doRun=0;
    doStop=0;
    doReadout=0;
    doSFBandSFC=0;
    
    useProto=daveProtoMPI_IBH;
    speed=daveSpeed187k;
    localMPI=0;
    plcMPI=2;
    
    if (argc<2) {
	usage();
	exit(-1);
    }    
    daveDebug=daveDebugPrintErrors;
    while (argv[adrPos][0]=='-') {
//	printf("arg %s\n",argv[adrPos]);
	if (strcmp(argv[adrPos],"-d")==0) {
	    daveDebug=daveDebugAll;
	} else
	if (strcmp(argv[adrPos],"-w")==0) {
	    doWrite=1;
	} else
	if (strcmp(argv[adrPos],"-s")==0) {
	    doStop=1;
	} else
	if (strcmp(argv[adrPos],"-r")==0) {
	    doRun=1;
	} else
	if (strcmp(argv[adrPos],"-b")==0) {
	    doBenchmark=1;
	} else
	if (strncmp(argv[adrPos],"--readoutall",12)==0) {
	    doReadout=1;
	    doSFBandSFC=1;
	} else
	if (strncmp(argv[adrPos],"--readout",9)==0) {
	    doReadout=1;
	} else
	if (strncmp(argv[adrPos],"--local=",8)==0) {
	    localMPI=atol(argv[adrPos]+8);
	    printf("setting local MPI address to:%d\n",localMPI);
	} else
	if (strncmp(argv[adrPos],"--debug=",8)==0) {
	    daveDebug=atol(argv[adrPos]+8);
	    printf("setting debug to:%d\n",daveDebug);
	} else
	if (strncmp(argv[adrPos],"--mpi=",6)==0) {
	    plcMPI=atol(argv[adrPos]+6);
	    printf("setting MPI address of PLC to:%d\n",plcMPI);
	} 
	else if (strncmp(argv[adrPos],"--wbit=",7)==0) {
	    wbit=atol(argv[adrPos]+7);
	    printf("setting bit number:%d\n",wbit);
	    doWbit=1;
	} 
	else if (strcmp(argv[adrPos],"-z")==0) {
	    doSZLread=1;
	}
	else if (strcmp(argv[adrPos],"-a")==0) {
	    doSZLreadAll=1;
	}
	else if (strcmp(argv[adrPos],"-m")==0) {
	    doMultiple=1;
	}
	else if (strcmp(argv[adrPos],"-c")==0) {
	    doClear=1;
	}
	else if (strcmp(argv[adrPos],"-n")==0) {
	    doNewfunctions=1;
	}
 	else if (strcmp(argv[adrPos],"-9")==0) {
 	    speed=daveSpeed9k;
 	} 
 	else if (strcmp(argv[adrPos],"-19")==0) {
 	    speed=daveSpeed19k;
 	} 
 	else if (strcmp(argv[adrPos],"-45")==0) {
 	    speed=daveSpeed45k;
 	} 
 	else if (strcmp(argv[adrPos],"-93")==0) {
 	    speed=daveSpeed93k;
 	} 
 	else if (strcmp(argv[adrPos],"-500")==0) {
 	    speed=daveSpeed500k;
 	} 
 	else if (strcmp(argv[adrPos],"-1500")==0) {
 	    speed=daveSpeed1500k;
 	} 
 	
	adrPos++;
	if (argc<=adrPos) {
	    usage();
	    exit(-1);
	}	
    }    
    
//    fds.rfd=setPort(argv[adrPos],"38400",'O');
    fds.rfd=openSocket(1099, argv[adrPos]);
    fds.wfd=fds.rfd;
    initSuccess=0;	
    if (fds.rfd>0) { 
	di =daveNewInterface(fds, "IF1", localMPI, useProto, speed);
	di ->timeout=5000000;
	for (i=0; i<3; i++) {
	    if (0==daveInitAdapter(di)) {
		initSuccess=1;	
		a= daveListReachablePartners(di,buf1);
//		a= 0;
		printf("daveListReachablePartners List length: %d\n",a);
		if (a>0) {
		    for (j=0;j<a;j++) {
			if (buf1[j]==daveMPIReachable) printf("Device at address:%d\n",j);
		    }	
		}
		break;	
	    } else daveDisconnectAdapter(di);
	}
	if (!initSuccess) {
	    printf("Couldn't connect to Adapter!.\n Please try again. You may also try the option -2 for some adapters.\n");	
	    return -3;
	}
	dc =daveNewConnection(di,plcMPI,0,0);  // insert your MPI address here
	printf("ConnectPLC\n");
	if (0==daveConnectPLC(dc)) {;
	    if(doWbit) {
		a=1;
		res=daveWriteBits(dc, daveFlags, 0, wbit, 1,&a);
	    }	
/*
 * Some comments about daveReadBytes():
 *
 * Here we read flags and not data blocks, because we cannot know which data blocks will
 * exist in a user's PLC, but flags are always present. To read from start of data block 5
 * (DB5.DBB0) use:
 * 	daveReadBytes(dc, daveDB, 5, 0, 16, NULL);
 * to read DBD68 and DBW72 use:
 * 	daveReadBytes(dc, daveDB, 5, 68, 6, NULL);
 * to read DBD68 and DBW72 into your applications buffer appBuffer use:	
 * 	daveReadBytes(dc, daveDB, 5, 68, 6, appBuffer);
 * to read DBD68 and DBD78 into your applications buffer appBuffer use:	
 * 	daveReadBytes(dc, daveDB, 5, 68, 14, appBuffer);
 * this reads DBD68 and DBD78 and everything in between and fills the range
 * appBuffer+4 to appBuffer+9 with unwanted bytes, but is much faster than:
 *	daveReadBytes(dc, daveDB, 5, 68, 4, appBuffer);
 *	daveReadBytes(dc, daveDB, 5, 78, 4, appBuffer+4);
 */	
	daveReadBytes(dc, daveFlags, 0, 0, 16,NULL);
/*
 *	daveGetDWORD(dc); reads a word (2 bytes) from the current buffer position and increments
 *	an internal pointer by 2, so next daveGetXXX() wil read from the new position behind that
 *	word.	
 */	
        a=daveGetS32(dc);	
        b=daveGetS32(dc);
        c=daveGetS32(dc);
        d=daveGetFloat(dc);
	printf("FD0: %d\n",a);
	printf("FD4: %d\n",b);
	printf("FD8: %d\n",c);
	printf("FD12: %f\n",d);
	
	
	if(doNewfunctions) {
	    saveDebug=daveDebug;
//	    daveDebug=daveDebugPDU;
	    
	    printf("Trying to read two consecutive bits from DB11.DBX0.1\n");;
	    res=daveReadBits(dc, daveDB, 11, 1, 2,NULL);
	    printf("function result:%d=%s\n", res, daveStrerror(res));
	    
	    printf("Trying to read no bit (length 0) from DB17.DBX0.1\n");
	    res=daveReadBits(dc, daveDB, 17, 1, 0,NULL);
	    printf("function result:%d=%s\n", res, daveStrerror(res));

	    daveDebug=daveDebugPDU;	    
	    printf("Trying to read a single bit from DB17.DBX0.3\n");
	    res=daveReadBits(dc, daveDB, 17, 3, 1,NULL);
	    printf("function result:%d=%s\n", res, daveStrerror(res));
	
	    printf("Trying to read a single bit from E0.2\n");
	    res=daveReadBits(dc, daveInputs, 0, 2, 1,NULL);
	    printf("function result:%d=%s\n", res, daveStrerror(res));
//	    daveDebug=0;	
	    
	    a=0;
	    printf("Writing 0 to EB0\n");
	    res=daveWriteBytes(dc, daveOutputs, 0, 0, 1, &a);
//	    daveDebug=daveDebugAll;
	    a=1;
	    printf("Trying to set single bit E0.5\n");
	    res=daveWriteBits(dc, daveOutputs, 0, 5, 1, &a);
	    printf("function result:%d=%s\n", res, daveStrerror(res));
	
	    printf("Trying to read 1 byte from AAW0\n");
	    res=daveReadBytes(dc, daveAnaIn, 0, 0, 2,NULL);
	    printf("function result:%d=%s\n", res, daveStrerror(res));
	    
	    a=2341;
	    printf("Trying to write 1 word (2 bytes) to AAW0\n");
	    res=daveWriteBytes(dc, daveAnaOut, 0, 0, 2,&a);
	    printf("function result:%d=%s\n", res, daveStrerror(res));
	
	    printf("Trying to read 4 items from Timers\n");
	    res=daveReadBytes(dc, daveTimer, 0, 0, 4,NULL);
	    printf("function result:%d=%s\n", res, daveStrerror(res));
	    d=daveGetSeconds(dc);
	    printf("Time: %0.3f, ",d);
	    d=daveGetSeconds(dc);
	    printf("%0.3f, ",d);
	    d=daveGetSeconds(dc);
	    printf("%0.3f, ",d);
	    d=daveGetSeconds(dc);
	    printf(" %0.3f\n",d);
	    
	    d=daveGetSecondsAt(dc,0);
	    printf("Time: %0.3f, ",d);
	    d=daveGetSecondsAt(dc,2);
	    printf("%0.3f, ",d);
	    d=daveGetSecondsAt(dc,4);
	    printf("%0.3f, ",d);
	    d=daveGetSecondsAt(dc,6);
	    printf(" %0.3f\n",d);
	    
	    printf("Trying to read 4 items from Counters\n");
	    res=daveReadBytes(dc, daveCounter, 0, 0, 4,NULL);
	    printf("function result:%d=%s\n", res, daveStrerror(res));
	    c=daveGetCounterValue(dc);
	    printf("Count: %d, ",c);
	    c=daveGetCounterValue(dc);
	    printf("%d, ",c);
	    c=daveGetCounterValue(dc);
	    printf("%d, ",c);
	    c=daveGetCounterValue(dc);
	    printf(" %d\n",c);
	    
	    c=daveGetCounterValueAt(dc,0);
	    printf("Count: %d, ",c);
	    c=daveGetCounterValueAt(dc,2);
	    printf("%d, ",c);
	    c=daveGetCounterValueAt(dc,4);
	    printf("%d, ",c);
	    c=daveGetCounterValueAt(dc,6);
	    printf(" %d\n",c);
	    
	    davePrepareReadRequest(dc, &p);
	    daveAddVarToReadRequest(&p,daveInputs,0,0,1);
	    daveAddVarToReadRequest(&p,daveFlags,0,0,4);
	    daveAddVarToReadRequest(&p,daveDB,6,20,2);
	    daveAddVarToReadRequest(&p,daveTimer,0,0,4);
	    daveAddVarToReadRequest(&p,daveTimer,0,1,4);
	    daveAddVarToReadRequest(&p,daveTimer,0,2,4);
	    daveAddVarToReadRequest(&p,daveCounter,0,0,4);
	    daveAddVarToReadRequest(&p,daveCounter,0,1,4);
	    daveAddVarToReadRequest(&p,daveCounter,0,2,4);
	    
	    res=daveExecReadRequest(dc, &p, &rs);
	    if (doWrite) {
		
	    }
	    
	    daveDebug=saveDebug;
	}

//	daveDebug=daveDebugAll;
	
	if(doSZLread) {
	
	    readSZL(dc,0x92,0x0);
	    readSZL(dc,0xB4,0x1024);
	    readSZL(dc,0x111,0x1);
	    readSZL(dc,0xD91,0x0);
	    readSZL(dc,0x232,0x4);
	    readSZL(dc,0x1A0,0x0);
	    
	    readSZL(dc,0x0A0,0x0);
	}
	
/*
	if(doSZLread) {
	    for (i=0;i<256;i++) {
		readSZL(dc,i,0x0);
	    }
	}    
*/	
	if(doSZLreadAll) {
	    readSZLAll(dc);
	}
	if(doMultiple) {
    	    printf("Now testing read multiple variables.\n"
		"This will read 1 Byte from inputs,\n"
		"4 bytes from flags, 2 bytes from DB6\n"
		" and other 2 bytes from flags\n");
    	    wait();
	    davePrepareReadRequest(dc, &p);
	    daveAddVarToReadRequest(&p,daveInputs,0,0,1);
	    daveAddVarToReadRequest(&p,daveFlags,0,0,4);
	    daveAddVarToReadRequest(&p,daveDB,6,20,2);
	    daveAddVarToReadRequest(&p,daveFlags,0,12,2);
	    daveAddBitVarToReadRequest(&p, daveFlags, 0, 25 /* 25 is 3.1*/, 1);
	    res=daveExecReadRequest(dc, &p, &rs);
	    
	    printf("Input Byte 0 ");
	    res=daveUseResult(dc, rs, 0); // first result
	    if (res==0) {
		a=daveGetByte(dc);
        	printf("%d\n",a);
	    } else 
		printf("*** Error: %s\n",daveStrerror(res));
		
	    printf("Flag DWord 0 ");	
	    res=daveUseResult(dc, rs, 1); // 2nd result
	    if (res==0) {
		a=daveGetInteger(dc);
        	printf("%d\n",a);
	    } else 
		printf("*** Error: %s\n",daveStrerror(res));
		
	    printf("DB 6 Word 20: ");	
	    res=daveUseResult(dc, rs, 2); // 3rd result
	    if (res==0) {
		a=daveGetInteger(dc);
        	printf("%d\n",a);
	    } else 
		printf("*** Error: %s\n",daveStrerror(res));
		
	    printf("Flag Word 12: ");		
	    res=daveUseResult(dc, rs, 3); // 4th result
	    if (res==0) {
		a=daveGetWORD(dc);
        	printf("%d\n",a);
	    } else 
		printf("*** Error: %s\n",daveStrerror(res));	
	    
	    printf("Flag F3.1: ");		
	    res=daveUseResult(dc, rs, 4); // 4th result
	    if (res==0) {
		a=daveGetByte(dc);
        	printf("%d\n",a);
	    } else 
		printf("*** Error: %s\n",daveStrerror(res));		
		
	    printf("non existing result (we read 5 items, but try to use a 6th one): ");
	    res=daveUseResult(dc, rs, 5); // 5th result
	    if (res==0) {
		a=daveGetWORD(dc);
        	printf("%d\n",a);
	    } else 
		printf("*** Error: %s\n",daveStrerror(res));		
	    
	    daveFreeResults(&rs);  
	    
	    if (doWrite){
		printf("Now testing write multiple variables:\n"
		    "IB0, FW0, QB0, DB6:DBW20 and DB20:DBD24 in a single multiple write.\n");
		wait();
//		daveDebug=0xffff;
		a=0;
	        davePrepareWriteRequest(dc, &p);
		daveAddVarToWriteRequest(&p,daveInputs,0,0,1,&a);
		daveAddVarToWriteRequest(&p,daveFlags,0,4,2,&a);
	        daveAddVarToWriteRequest(&p,daveOutputs,0,0,2,&a);
		daveAddVarToWriteRequest(&p,daveDB,6,20,2,&a);
		daveAddVarToWriteRequest(&p,daveDB,20,24,4,&a);
		a=1;
	    	daveAddBitVarToWriteRequest(&p, daveFlags, 0, 27 /* 27 is 3.3*/, 1, &a);
		res=daveExecWriteRequest(dc, &p, &rs);
		printf("Result code for the entire multiple write operation: %d=%s\n",res, daveStrerror(res));
/*
//	I could list the single result codes like this, but I want to tell
//	which item should have been written, so I do it in 5 individual lines:
	
		for (i=0;i<rs.numResults;i++){
		    res=rs.results[i].error;
		    printf("result code from writing item %d: %d=%s\n",i,res,daveStrerror(res));
		}
*/		
		printf("Result code for writing IB0:        %d=%s\n",rs.results[0].error, daveStrerror(rs.results[0].error));
		printf("Result code for writing FW4:        %d=%s\n",rs.results[1].error, daveStrerror(rs.results[1].error));
		printf("Result code for writing QB0:        %d=%s\n",rs.results[2].error, daveStrerror(rs.results[2].error));
		printf("Result code for writing DB6:DBW20:  %d=%s\n",rs.results[3].error, daveStrerror(rs.results[3].error));
		printf("Result code for writing DB20:DBD24: %d=%s\n",rs.results[4].error, daveStrerror(rs.results[4].error));
		printf("Result code for writing F3.3: 	    %d=%s\n",rs.results[5].error, daveStrerror(rs.results[5].error));
/*
 *   Read back and show the new values, so users may notice the difference:
 */	    
	        daveReadBytes(dc,daveFlags,0,0,16,NULL);
    		a=daveGetDWORD(dc);
	        b=daveGetDWORD(dc);
    		c=daveGetDWORD(dc);
    		d=daveGetFloat(dc);
	        printf("FD0: %d\n",a);
		printf("FD4: %d\n",b);
		printf("FD8: %d\n",c);
	        printf("FD12: %f\n",d);		
	    } // doWrite
	}	    

	if(doWrite) {
    	    printf("Now we write back these data after incrementing the integers by 1,2 and 3 and the float by 1.1.\n");
    	    wait();
/*
    Attention! you need to bswap little endian variables before using them as a buffer for
    daveWriteBytes() or before copying them into a buffer for daveWriteBytes()!
*/	    
    	    a=bswap_32(a+1);
    	    daveWriteBytes(dc,daveFlags,0,0,4,&a);
    	    b=bswap_32(b+2);
    	    daveWriteBytes(dc,daveFlags,0,4,4,&b);
    	    c=bswap_32(c+3);
	    daveWriteBytes(dc,daveFlags,0,8,4,&c);
    	    d=toPLCfloat(d+1.1);
    	    daveWriteBytes(dc,daveFlags,0,12,4,&d);
/*
 *   Read back and show the new values, so users may notice the difference:
 */	    
    	    daveReadBytes(dc,daveFlags,0,0,16,NULL);
    	    a=daveGetDWORD(dc);
    	    b=daveGetDWORD(dc);
    	    c=daveGetDWORD(dc);
    	    d=daveGetFloat(dc);
	    printf("FD0: %d\n",a);
	    printf("FD4: %d\n",b);
	    printf("FD8: %d\n",c);
	    printf("FD12: %f\n",d);
	} // doWrite
	if(doClear) {
    	    printf("Now writing 0 to the bytes FB0...FB15.\n");
    	    wait();
	    a=0;
    	    daveWriteBytes(dc,daveFlags,0,0,4,&a);
    	    daveWriteBytes(dc,daveFlags,0,4,4,&a);
	    daveWriteBytes(dc,daveFlags,0,8,4,&a);
    	    daveWriteBytes(dc,daveFlags,0,12,4,&a);
	    daveReadBytes(dc,daveFlags,0,0,16,NULL);
    	    a=daveGetDWORD(dc);
    	    b=daveGetDWORD(dc);
    	    c=daveGetDWORD(dc);
    	    d=daveGetFloat(dc);
	    printf("FD0: %d\n",a);
	    printf("FD4: %d\n",b);
	    printf("FD8: %d\n",c);
	    printf("FD12: %f\n",d);
	} // doClear
	if(doStop) {
	    daveStop(dc);
	}
	if(doRun) {
	    daveStart(dc);
	}
	if(doReadout) {
	    loadBlocksOfType(dc, daveBlockType_OB);
	    loadBlocksOfType(dc, daveBlockType_FB);
	    loadBlocksOfType(dc, daveBlockType_FC);
	    loadBlocksOfType(dc, daveBlockType_DB);
	    loadBlocksOfType(dc, daveBlockType_SDB);
	    if (doSFBandSFC){	    
		loadBlocksOfType(dc, daveBlockType_SFB);
	        loadBlocksOfType(dc, daveBlockType_SFC);
	    }
	}    

	if(doBenchmark) {
	    rBenchmark(dc);
	    if(doWrite) {
		wBenchmark(dc);
	    } // doWrite
	} // doBenchmark
/*	
	i=1;
	res=daveReadBytes(dc, daveInputs,0, 256, 2,NULL);
	printf("function(%d) result:%d=%s\n",i, res, daveStrerror(res));
//	i=128;
//	res=daveReadBytes(dc, i, 0, 320, 2,NULL);
//	printf("function(%d) result:%d=%s\n",i, res, daveStrerror(res));
*/	    
	
	printf("Now disconnecting\n");	
	daveDisconnectPLC(dc);
	daveDisconnectAdapter(di);
	return 0;
	} else {
	    printf("Couldn't connect to PLC.\n");	
	    daveDisconnectAdapter(di);
	    daveDisconnectAdapter(di);
	    daveDisconnectAdapter(di);
	    return -2;
	}
    } else {
	printf("Couldn't open serial port %s\n",argv[adrPos]);	
	return -1;
    }	
}

/*
    Changes: 
    02/15/05 copied from testMPI and modified for IBH.
*/
