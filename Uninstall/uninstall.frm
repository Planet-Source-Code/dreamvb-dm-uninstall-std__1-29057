VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MsComCtl.ocx"
Begin VB.Form Form1 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "DM Uninstaller Standard"
   ClientHeight    =   5775
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6645
   Icon            =   "uninstall.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5775
   ScaleWidth      =   6645
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   330
      Left            =   0
      TabIndex        =   2
      Top             =   5445
      Width           =   6645
      _ExtentX        =   11721
      _ExtentY        =   582
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Bevel           =   2
            Object.Width           =   11668
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar Toolbar1 
      Height          =   780
      Left            =   30
      TabIndex        =   1
      Top             =   4575
      Width           =   6585
      _ExtentX        =   11615
      _ExtentY        =   1376
      ButtonWidth     =   1349
      ButtonHeight    =   1376
      AllowCustomize  =   0   'False
      Wrappable       =   0   'False
      Style           =   1
      ImageList       =   "ImageList1"
      DisabledImageList=   "ImageList1"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   4
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Remove"
            Key             =   "REMOVE"
            ImageIndex      =   2
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "View Info"
            Key             =   "INFO"
            ImageIndex      =   3
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "About"
            Key             =   "ABOUT"
            ImageIndex      =   4
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Exit"
            Key             =   "EXIT"
            ImageIndex      =   5
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lstview 
      Height          =   4470
      Left            =   15
      TabIndex        =   0
      Top             =   60
      Width           =   6600
      _ExtentX        =   11642
      _ExtentY        =   7885
      View            =   3
      Arrange         =   1
      LabelEdit       =   1
      Sorted          =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      Icons           =   "ImageList1"
      SmallIcons      =   "ImageList1"
      ForeColor       =   -2147483647
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   1
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Select the items you whish to uninstall"
         Object.Width           =   3175
      EndProperty
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   4440
      Top             =   5625
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   5
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "uninstall.frx":0CCA
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "uninstall.frx":19A4
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "uninstall.frx":267E
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "uninstall.frx":3358
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "uninstall.frx":4032
            Key             =   ""
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function WinExec Lib "kernel32" (ByVal lpCmdLine As String, ByVal nCmdShow As Long) As Long
Dim IntString As String
Private Sub LoadList()
Dim StrDisName As String
Dim Icnt As Integer
    IntString = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\"
    REG32.GetKeyNames HKEY_LOCAL_MACHINE, IntString
    For Icnt = 1 To sKeys.Count - 1
        StrDisName = GetString(HKEY_LOCAL_MACHINE, IntString & sKeys(Icnt), "DisplayName")
        If Len(StrDisName) > 0 Then
            lstview.ListItems.Add , sKeys(Icnt), StrDisName, 1, 1
        End If
    Next
    lstview.ColumnHeaders(1).Width = lstview.Width - 500
    Set sKeys = Nothing
    StrDisName = ""
    StatusBar1.Panels(1).Text = Icnt & " Items Found"
    
End Sub
Private Sub cmdinfo_Click()

End Sub


Private Sub Form_Load()
    Set sKeys = New Collection
    LoadList
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set Form1 = Nothing
    Set frminfo = Nothing
    IntString = ""
    
End Sub

Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)
Dim Progname As String, ProgPub As String, ProgVer As String, strRemove As String, _
Mess As String
Dim ans

    Select Case Button.Key
        Case "REMOVE"
            strRemove = GetString(HKEY_LOCAL_MACHINE, IntString & lstview.SelectedItem.Key, "UninstallString")
            ans = MsgBox("Are you sure you want to uninstall this item", vbYesNo Or vbInformation, "Uninstall")
            If ans = vbNo Then
                Exit Sub
            Else
                WinExec strRemove, 1
            End If
        
        Case "INFO"
            Progname = lstview.SelectedItem.Text
            ProgPub = Trim(GetString(HKEY_LOCAL_MACHINE, IntString & lstview.SelectedItem.Key, "Publisher"))
            ProgVer = Trim(GetString(HKEY_LOCAL_MACHINE, IntString & lstview.SelectedItem.Key, "DisplayVersion"))
    
            If Len(ProgVer) = 0 Or Len(ProgPub) = 0 Then
                frminfo.lblprogname = Progname
                frminfo.lblpub = "No information"
                frminfo.lblprogver = "Version not found"
            Else
                frminfo.lblprogname = Progname
                frminfo.lblpub = ProgPub
                frminfo.lblprogver = ProgVer
            End If
    
            frminfo.Show vbModal
        
        Case "ABOUT"
            Mess = Mess & "DM Uninstaller Standard for Windows 2000" & vbCrLf
            Mess = Mess & "Writen and designed by Ben Jones" & vbCrLf
            Mess = Mess & "Other windows Versions commaing soon"
            MsgBox Mess, vbInformation, "About..."
            Mess = ""
            
        Case "EXIT"
            ans = MsgBox("Do you want to quit this program now", vbYesNo Or vbInformation, "Exit Program....")
            If ans = vbNo Then
                Exit Sub
            Else
                Unload Form1: End
            End If
        End Select
        
End Sub
