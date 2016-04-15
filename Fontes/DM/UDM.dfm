object DM: TDM
  OldCreateOrder = False
  Left = 220
  Top = 113
  Height = 150
  Width = 215
  object conexao: TSQLConnection
    ConnectionName = 'conexao'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      
        'Database=C:\Users\adm\Desktop\TCC - PROJETO\SOFTMETAL\Metalurgic' +
        'a - SoftMetal\Banco\BANCO.FDB'
      'RoleName=RoleName'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'gds32.dll'
    Connected = True
    Left = 32
    Top = 16
  end
  object SqlAuxiliar: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao
    Left = 96
    Top = 16
  end
end
