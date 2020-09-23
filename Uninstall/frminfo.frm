VERSION 5.00
Begin VB.Form frminfo 
   BackColor       =   &H00C0FFFF&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "About this program"
   ClientHeight    =   2445
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3705
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2445
   ScaleWidth      =   3705
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "&Close"
      Height          =   390
      Left            =   2715
      TabIndex        =   5
      Top             =   1965
      Width           =   930
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   90
      Picture         =   "frminfo.frx":0000
      Top             =   105
      Width           =   480
   End
   Begin VB.Label lblprogver 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Version not found"
      ForeColor       =   &H000000FF&
      Height          =   195
      Left            =   1020
      TabIndex        =   4
      Top             =   1500
      Width           =   1245
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Verision"
      Height          =   195
      Left            =   270
      TabIndex        =   3
      Top             =   1500
      Width           =   555
   End
   Begin VB.Label lblpub 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "No information"
      ForeColor       =   &H000000FF&
      Height          =   195
      Left            =   1020
      TabIndex        =   2
      Top             =   1215
      Width           =   1020
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Publisher"
      Height          =   195
      Left            =   270
      TabIndex        =   1
      Top             =   1215
      Width           =   645
   End
   Begin VB.Label lblprogname 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Null"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   300
      Left            =   270
      TabIndex        =   0
      Top             =   720
      Width           =   465
   End
End
Attribute VB_Name = "frminfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Unload frminfo
    
End Sub
