/****************************************************************************
**
** Copyright (C) 2000-2006 Lehrig Software Engineering.
**
** This file is part of the pvbrowser project.
**
** This file may be used under the terms of the GNU General Public
** License version 2.0 as published by the Free Software Foundation
** and appearing in the file LICENSE.GPL included in the packaging of
** this file.
**
** This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
** WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
**
****************************************************************************/
#ifndef DLG_SEARCH_REPLACE_H
#define DLG_SEARCH_REPLACE_H

#include "ui_dlgsearchreplace.h"
#include "editor.h"

class dlgsearchreplace : public QDialog
{
  Q_OBJECT

  public:
    Ui_DialogSearchReplace *uidlg;
    dlgsearchreplace();
    ~dlgsearchreplace();
    void runFind(Editor *_editor);
    void runReplace(Editor *_editor);

  private slots:
    void slotFindNext();
    void slotReplace();

  private:
    Editor *editor;
    int found;
};

#endif
