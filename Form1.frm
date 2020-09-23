VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   3390
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4755
   LinkTopic       =   "Form1"
   ScaleHeight     =   3390
   ScaleWidth      =   4755
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Label Label3 
      BackColor       =   &H80000002&
      Caption         =   "r"
      BeginProperty Font 
         Name            =   "Marlett"
         Size            =   8.25
         Charset         =   2
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000009&
      Height          =   195
      Left            =   4560
      TabIndex        =   2
      ToolTipText     =   "Exit"
      Top             =   0
      Width           =   195
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H80000002&
      Caption         =   "DragMe"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000009&
      Height          =   195
      Left            =   120
      TabIndex        =   1
      Top             =   0
      Width           =   555
   End
   Begin VB.Label Label1 
      BackColor       =   &H80000002&
      Caption         =   "o"
      BeginProperty Font 
         Name            =   "Marlett"
         Size            =   8.25
         Charset         =   2
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000009&
      Height          =   195
      Left            =   4500
      TabIndex        =   0
      ToolTipText     =   "Resize"
      Top             =   3000
      Width           =   195
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_resize()
'Incase we size our form to small to place controls
On Error Resume Next

'Placement of the Resize Label
Label1.Left = Me.Width - 195
Label1.Top = Me.Height - 195

'Placement of the Titlebar Label
Label2.Top = 30
Label2.Left = 30
Label2.Width = Form1.Width - 300

'Placement of the Exit Label
Label3.Left = (Form1.Width - Label3.Width) - 30
Label3.Top = 30
End Sub

Private Sub Label1_MouseMove(Button As Integer, ShiftState As Integer, X As Single, Y As Single)
'Change The Pointer Icon
Screen.MousePointer = 8

'If button is down then start resize
If Button = 1 Then
        ReleaseCapture
        SendMessage Me.hwnd, WM_NCLBUTTONDOWN, HTBOTTOMRIGHT, 0&
End If
End Sub
Private Sub Label2_MouseMove(Button As Integer, ShiftState As Integer, X As Single, Y As Single)
'Change The Pointer Icon
Screen.MousePointer = 5

'If button is down then start move
If Button = 1 Then
        ReleaseCapture
        SendMessage Me.hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&
End If
End Sub

Private Sub Label3_Click()
'Close the Form
Unload Me
End Sub

Private Sub Form_MouseMove(Button As Integer, ShiftState As Integer, X As Single, Y As Single)
' Return The pointer back to Default
Screen.MousePointer = 0
End Sub
