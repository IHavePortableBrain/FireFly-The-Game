object FMainMenu: TFMainMenu
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FireFly'
  ClientHeight = 353
  ClientWidth = 500
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Vladimir Script'
  Font.Style = []
  Menu = MainMenuBar
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    500
    353)
  PixelsPerInch = 96
  TextHeight = 13
  object PanelVideo: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 353
    ParentCustomHint = False
    BiDiMode = bdLeftToRight
    Caption = 'PanelVideo'
    Ctl3D = False
    DoubleBuffered = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    ParentBackground = False
    ParentCtl3D = False
    ParentDoubleBuffered = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
  end
  object btnQuit: TButton
    Left = 352
    Top = 8
    Width = 113
    Height = 49
    ParentCustomHint = False
    BiDiMode = bdLeftToRight
    Caption = 'Quit'
    DoubleBuffered = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Vladimir Script'
    Font.Pitch = fpFixed
    Font.Style = []
    Font.Quality = fqProof
    ImageMargins.Left = 100
    ImageMargins.Top = 100
    ImageMargins.Right = 100
    ImageMargins.Bottom = 100
    ParentBiDiMode = False
    ParentDoubleBuffered = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    OnClick = btnQuitClick
  end
  object btnPlay: TButton
    Left = 32
    Top = 8
    Width = 113
    Height = 49
    ParentCustomHint = False
    BiDiMode = bdLeftToRight
    Caption = 'Play'
    DoubleBuffered = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Vladimir Script'
    Font.Style = []
    Font.Quality = fqProof
    ParentBiDiMode = False
    ParentDoubleBuffered = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    OnClick = btnPlayClick
    OnKeyUp = btnPlayKeyUp
  end
  object STGameLogo: TStaticText
    Left = 191
    Top = 9
    Width = 109
    Height = 49
    ParentCustomHint = False
    Alignment = taCenter
    Anchors = []
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    Caption = 'FireFly'
    Color = clBlack
    DragKind = dkDock
    DragMode = dmAutomatic
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -37
    Font.Name = 'Vladimir Script'
    Font.Pitch = fpFixed
    Font.Style = []
    Font.Quality = fqProof
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    Transparent = False
  end
  object MediaPlayer: TMediaPlayer
    Left = 75
    Top = 115
    Width = 253
    Height = 30
    EnabledButtons = [btPause]
    DoubleBuffered = True
    FileName = 'C:\Users\'#1072#1076#1084#1080#1085'\Desktop\'#1050#1091#1088#1089#1072#1095'\Soundtrack\MainTitle.mp3'
    Visible = False
    ParentDoubleBuffered = False
    TabOrder = 3
  end
  object SoundPanel: TPanel
    Left = 450
    Top = 287
    Width = 66
    Height = 66
    Hint = 'Mute\unmute'
    Alignment = taRightJustify
    AutoSize = True
    Caption = 'SoundPanel'
    Color = clBackground
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Vladimir Script'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
    object SoundHandle: TImage
      Left = 1
      Top = 1
      Width = 64
      Height = 64
      AutoSize = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000400000
        00400806000000AA6971DE00000006624B474400FF00FF00FFA0BDA793000000
        097048597300000B1300000B1301009A9C180000000774494D4507DD0C1C162C
        2E400719D400001C334944415478DAED5B09741455D6BEAFAA7A4BA7B3872440
        08090921B2CABECB22A080222A82E0060AE8A08EA2B20CE828836C0A222E38A2
        E28828020A8388CABECABE832C020949082424214927BD56D5FBEF7B55DDE94E
        B38833CE38E7FC9553E9EAEAEAAA77BFBB7DEFDED704FE83DBF84F37992E94A9
        D6FDE7CB8C8517CE48788A9805A2B66954DBF3FAB0CE554D32EA3BFE93E3611B
        F93D6FFED0B4AFAC650E67CB9325559D44D1D0FA8A93D4A76258B40C867041AE
        3209B8C9B297524A149582EA3250252BDA70C0E0B5AFFEE44F3D9737CBCC2AFC
        9F0360E4DC55497B4FE7DFEE52C53B15634407536474527CB4C99418130EF191
        3688319BC16631003586812819405164A028BDD3E982F232075C2C2A854BA515
        907BA91C9C5E7ADE2495AD8B94945507E68EFC9E1022FF2101F8F382B524FBFC
        85C46287FC728E5DBC2F313E3AA6515A5D29AD6E6D88B41AC1835AB63B5DE44A
        B9032A1C5EA8A8F280E22C032A2B60341AC062B14098D502915166888A8A0633
        8224480238EC2E38F5CB39D871F43C94BBC0D33A5E9ED4B6BEF59D19A3EF75FF
        6100183DE3F306DF9DF34C1324C31D99A9891199A9C9106EB34195C305172E95
        D20B8597B9E0956E0F78BD2A6A1C808200B228F0EF53CA06C1FE1130E0519849
        80689B09126222A06E520CD44BAC456D6166525156063B8F1C87FDD9F6D22CE5
        DC9733EE8C7EA9EB7D4F39FF6B003CF5FE1AEBA1339747965438A7D54E4DB1B4
        68710B18054081CBC8D9F39720EF5209D83D2A17963D85E01F7E0C84BD457929
        1141AD310082671820802E21E04526A308311116488E8B84B4E4584849AE0DAE
        2A07ACD875064A0BF28A526CEAE31F0CEFB4A6715686FA1F05E0C5F92B1A7EB5
        FFCAB2E8186BD39E1D9B9348AB0D0E9F3A4F4FE614922B1595A0500232970EA5
        15442691F63012F838E12A77AE964355B56381AA20092AD8CC2224201099A975
        69F3FAB1A4B0B80CBED87C4AF6C8EAC6958F361CD8AE6D8BDF94416E1A809EE3
        3E1C9E5DA6CE69DCF896A836CD52E164EE65BAFB7801B9525A0982E206054D9B
        0892766B2AA02651EF28000979524D00D8058AFF1DA606BE33F76060500442C0
        4BAC2611EAC7DBA059560624C4C7C2F6DDFBE1C4D9FC930D63C29ED83073E88E
        DF0D80891F7E6BF8E94CD12B172BE9D86E9DDB862526C6D3D5DB4F9082BC6C20
        E8D81EC1827E6D642AD3CC9D8A28228281D64024A5C6DDF01A22853C8352D93F
        241F000A731C6E0D540B1878CCAC22DC16064D5213A073F3347AECDC45F2D39E
        2385752CDE2777BC3572E5BF1D802DE7A961CC9B0BDF40C31EDDB17B17B39B4A
        74FBE63DA4A80A4564564E54F60FFD1A7751E4DE2E8008A2CA2100080180B943
        A80B50EABB8EF8019041D48457BD20A80A0781B91803024304A4D4898536CD1A
        40B9D30D87761D288954E4493BDE1BF1F77F1B00A3E6AE341EB85039D5E5F13E
        D7AD5B474389DD4D37EC3842DC18D10566EA6C47C199890B5C30097791FBBB6F
        67E3F53DA93A0E845A05A592EF880BCAF801BB8E993FD73EBEAA54B704C61FD8
        75B8D5898F844E4D1BD04A59211BF71EABCAB0540CD9326BF4EA7F190046D1BA
        4F5EF242A9BDECE50E9D3A475C2E77C2CE7DC7C1839A5540E2BECE0412044D9B
        EC9527B300E105DC9500E1AF0D00532AA9F97C7421AFDF1AFC3B13DEE7226809
        120293106B835B9BA7A295B860F3AE63154DE3AD03D6BC3664F3BF04C0EDAF2E
        BBFB6491FDD36E1D9A477BBC846EDEBE9F7093E4BE2E7133D676520D04954200
        5085EAC7540340AF0278B0F06C47C6E0CF08BE732A678FFA3955B30A666589B1
        66748774282D2D83E3474E64776894DCEECBB17D2FFF2600262CDA50EFEBDDD9
        3FA46564662526D4A23F6CDC435C5E145F3282CA84C6F426D6109E1F53CD25FC
        EF75007C0FD200609286C600157DDC07901F00B4003540FBAACFFC290D024605
        2D53D4898F80AECD5231301692D2DCB31B9EBEB359BFA70674B82673BC2A006F
        AC3A68FE62DBA1CF0453D87DED5AB711D66F3C0897918030C1454C738CC4B0AF
        4A3E2105816B9A70C263D45D8281A07DA6120D008DF17114788A0C52398745F5
        0FCA272C7301FE099B2D61B6617E4FD96B4DB760EEA0A03B60404EAB570B1A37
        A8037B0E1CF5488ED2B187E7FFE9BD9B0260D0D445771DCB295CDCBE7B0FDBDE
        A317A0A0C80EAA48B8B9076A56080878BEF38CF8105D60CAAFC103340A859AC0
        881A36081E701223B7209F2D68F91E8284E196C318210ADBA561348CE99E024B
        F716C032DC81BAB9B639283A475078A054794A9670ACCDB3EA535BB8891C397A
        F2CCAD71D063D9CB0FE5FD2A00BE3F5A687B65E1B79BA26A25B40C8B8A27DBF6
        9C440DE28031BD050AAF01600C7E2F68D6C135EF3F0F10A99640992111C39E11
        8CD485C2E3C0054390BFC3550060AF264C8D1BC7B583BAD1167ECD9F161D8155
        0772FD2EA00180E99201C0D3A4CA5D24D26681762D1A425E4EB6E22ABEB8F085
        C1DD470FEBD248BD2100C3677C3E667B9E676EAB8EEDA41DBB8E42A5C3C3531B
        653E2F8AC13E1F10F1432CC01714F155164C60521DD0B1BE055A217B9CFFED51
        F018C2FD2E40035CC10780EF98C832CCB82F1306B74DE2EF4B2A3DD0F6B58DE0
        414D0702A0F04C89C70C0495856A051AE0FCA136D2E7FD3FE75C488936F7D936
        F5FEE3D705E0B5A5BBC3576C3FB4D61857B7836834C3C95388346A8AF05D1328
        706700B0CD27BCC08990C46F5A6D2D02788D11D03F5D81A9F73604876280BE33
        7780D310563304F8831A7B259CEB501099A078E1777F6E055949E1FCF34D278A
        E091057BF8E71A60E8029842590C60D34DC23207BE5ACD0432D3EB4251F1158F
        A1AA74DE81B747BC745D005EF8686BCF6F8EE6ADCCCA4C0D3FF1F32FB4DCA110
        2A98512823467CEAB7001F00800008352D8067083D5EE0FB30F4FF7B9B46C263
        7D1A413DAB170A1533F49EB2033C460B863C1230003DCAA350FD1A47C3F8DEF5
        20EF8A0B862D38CA056C58CB0AAB9F6DA9055AFCD7FFAD1D7028B70CC1D16690
        DC0214CAB5CF5C41C5571C3DD4A965A3891146B8949F7FBA419CADDFB7AF0E3E
        7B4D00EE797DC5E21CBB3A34322E8E1E3B914338E59450CBE802524D0BC04130
        50043479CA19A1C88537E2773C5238C60C01E249190C6C9304636ECF807023A3
        B50254B864E8F0C66974010318BC2E4C738A16E569F58CF1DD07D2A157A3287E
        BCFA70218C5D7202D01161CEA04C18786B02BFEEC76397E1898507184FD4D227
        135A51F931A7CB2AA3CC146C06042F2D092E5F2AA88A502A2636AF17F3EE0763
        07D31000966F3D5A6FD6D2ADBBCDB533120B4AEC505C6AD7C80ED3BA684061AB
        01600363D6A0EA549831420E020A18860FF54A611069F4C2F02E31F0509B3A10
        13862E84827AD033AF383DD075F659BCAE1CEC6EE04C8EA53F8DF6022F16DC96
        1105FF18D19CBFF5A2567BCEDA01D9C555BC5E706A7A6F08336994B9E9E4F550
        6A77E277755EC00C40F72B85A54ABCB7A8BA212929162C06A2BA0ACFFE33AB4E
        CCD0A5931F768500F0DC876B067EBF2F6759425AA678FC973C7C943EADE5662F
        6A00E82EC0841778C063A4078FD91498E77711351B032952193CD6291EEEED98
        0A312C4C309010003702508441ACF7BC7360C0A058E9747156C7EA00064C5D4C
        581E00D18AE60CC982FB5A69816FEBE95278F8A303DC3DA6DC930123BAA4F231
        7FB32F1FC67CB69F073ECA81049E5E796064B346C583007BC180D6C6ACE062CE
        D9B3C9F191BD364D199C1D02C0C0695FBF71E4A2E385F0C81892935F884231E1
        252D5F07B03E66010C00115F2BC1024649E0839704ADF2136712E0C53BEB43DF
        2C2BA0E2D11A6C48032837751702907DD9090F7C5A005E64956E67390ED60BDD
        1B46C107C36E8115070B61DC37BF20B7A760C5A9DEF689ED212A4C0BB477CDDB
        0B87F32BE0D6BA56F8E7B3EDF9B96234A176AF6D0087DBA30340F9583552840E
        277BB8EB1055A68DD312C8C592D2CAD448E9E10DAF3EB03204801E93BED870DE
        69EAC1826A49590561BEED034020A25F707F0044305AA544405C94954F4B9986
        931262A07F032BA69F387E8E97C01868A07DEE40008EE43B60F492429065159C
        0800A0892E79A209B4AD1FA909FADE41385A50C58F67DD9B0E0FB44AE4C74BF7
        5F8217969DE244E7F8DFBA82CD2C81DBAB40EF3777C299C2723E95D6B282AABB
        005A96AC591DC167A4C588A80C8B1AE9BC306BE7DB4F4F0C02001113DB4F5A76
        BE4A35D729AE7082D3E5E56446E0DAD704A69204663455E6DF06146A70D30898
        F9707B1042283D37444D1BFC90F0004788024E2AC2D10B55307A7931923919AA
        9C15A8390F0C6B930053EE4AE3DFBE8C2ED26EE63E0E5C46BC057E78A605D7E8
        B96227F4997700BC1E1966DED71086B4ADCDAF7FE6F3A3B0627F1E77231F27D0
        2C40730B2F06465647B01809C4C562607596AC5D356E40BFFA8911B21F809DA7
        F39386BFBB21470C8B31169694E397A046CEC71C8B932096B814CCDFACD6F362
        DF86F06C8FE46A23D2CABBA093DAA004A7F2F732D7460EBAC0E0CFD1C5D42A70
        54B978BE0E370BB0F5F996106ED262CCFD0B8EC0C1BC4A7ECFDDE3DB405CB891
        E7F856D376415995079AD7B1C2CAA75BF36BFFB1231F267F7D945B804F707F10
        64EF652FE706AC089D98580BCA8AF2B2DF7CB875B307BBB6A8F403B0ED645E97
        47DE5EBFC5608B23C52525983EA4A09CCFFC5D410B30A14A15D1C203E284FE99
        30A65B3D1EB06E54565179C6C72C801650887E7BF72708003A84CBE1028FD389
        8394E18DFB33E17EDDDC67FD700EDEDB9CCBDDE62FFDD26154D7147E7EC8FCBD
        B0ED7431CE270864BFD9878F6FE79952183C7F8FEE0201CC500780055915EFCF
        AA56F171B15076F942D98251DD1A0FE89059E00760E9CE33839EFF6CE7526358
        14949715E3708D21AC8F153B4D78350340C2A83EF1AE0C78AA6B720D5D5F1F00
        2F02508AEE75E78717D116A240F55E822A7B19785C2E689E1C0E2BC6B4E2D76F
        3C5902C33F39C4980DF4CA8A858F1F6FCDCF4F5DF533BCB7EE34B78C23D3FB42
        BCCD0479A54EE83C6DAB3E3952AA35EF9B312A1A2B2454065BB80D1C8E72F7D3
        DD539ABFFA50CF537E00E6ADDEFFF8D455273E3258C2C059518AF9DD725D000C
        08C05FEE6E08A3BB24FB7DFED70120801DFDABE7FB17C0826449F15440A5BD14
        9C6E17172067FA6DFCFA5F0AABA0C7ECDDBCF8D9A43632C0E7DA736D7FB12B17
        5EFCE210BFE34F2FF782FAF156707814B8E52F6B799C61413010007FED80CF1B
        BC60349A40F1BA69CF34430B9C1D1EF10330EDCB2D4FCE599733DF4D75E2C338
        9B200601C06684263423160B58CA9B747726029002BF66AB0940EF0F2E8159A2
        E0C1C1DBEDE5E0763BF8A04FBEDA01CC0674930A0FB499BE8BFB6EC35A1658F7
        423B0EC08F478B60C4C77BF158854D13BA4146820D03BD0A19E33400D8943810
        00E06EA1F8E302038820E3EA911ED66AE5E4070EFA01786FF5FE1153561EFDD8
        210B7ADE87100BD000C01B233596F09AC96801A36E1A00CD05FA7D5408668AD6
        26A3055496A392340B38850018D0D22E96BBA1FDCC3D3CE531007E1CDB9603B0
        E648218C5AB85F03607C37484F08E700A48D5F8FC26AA5B36B01E09B6748480A
        FA6545B45A3CEEBE6A0BF862DBA9FB5FFC6CD7B20A3752474E808450DA8B0018
        1100553270523479007381FA370D40314EAFFB7F5C0412E668BBB30ADCAE4A8C
        056E245400A7A76A2E70EC821DFABEBD8F7FB365B20D563ED3960BF0C9B65C78
        65C5717EAF9F26F7807AB15628C3FB359EBC412F93A9FE024B4D007C01D22228
        8E515D926F9D36A2CF693F00EB8FE5767EEC9D4D9B2B9CB2C818A05AC3FC39F1
        C139BD0101A0061327362F0FC8400B48BD69004A9C5EB8E3EF05403C7634FF2A
        90BD1ECEE5FB358B87F90F37E3835F71F0123CFFE509FEDD7B5B25C05B431AF3
        E3895F9F80CF7FCAC3E77BE1F0DF7A214B3462BCB04397A91BB9B0BC50CA67A3
        820E40A8555805B9F49327BB35EEDF2EE3921F80D5072F243DFFE9F6B3974BED
        16411241C6F97F4D002802C02C40662E80DF1977472A3CDB2BF32AE2EAD57AAA
        5583784F03342224630CA842CD7779271F8910F2804A24428A977FE3CB912DA0
        4383683ED0895F9F8225FB0AF9E0DE199A05FD9BD5E277EE8F74F8485E3960F0
        87E3536FE7E7D61DBB048F2ED8AB97CA555E866353718D0869E7340054EE2E31
        265A90F7F7E1F5D1B2BD7E009C949A7A8F5F74EC5021A423E9C13041898FF6FA
        5E41A87ECFDC222A220CE60DCE84DA09110888CA73B664304294A080C1128ED7
        529C1A7BC04B4C7C2EC03E477EC92B39ED679FC7D4E4C69464E7F9BB6E9409D6
        3DD71203A3462BBBBEB107F2CAF9F820E7F5CEFCD581CCB12512A12A9C4EF76B
        1C0B1F3CD2949F9FB7EE1CCC5873DADF3F08E4015E045DF2CA3C03B859CB0EEF
        D125C1BEEDC7375FE8EA53973F7FDDF9CA97AB77643BFA5211896EC0D4B72600
        D5951E24FBAC448E5667C4C8CD84B4865BA165BD4878A957123488A1201AC239
        4F100200A8C2C8DF656E0E7865CC02EE2BBC8637A1773D18D9B90EBFEF7AE400
        4F2C3AC19FD3B351342C1896C58562F383811F1CE68C70F1F026D0B9610C17F4
        91058760D3C9CB781F4F509D90018036079207358FCF76124A8DB24C6E4B2C7F
        79F5ACB1534300183A63F994B5C72F4F72095641A851FC6020F09A6040519407
        4B60C552648D7C3A2BF2E9B0C310091D62CAE0F9BBB390DC4462D041CDB0E229
        0740E40591AE73CF71AD783D0EEE23D3EE4E85412D6BF1E970ABE97BA0D28D9A
        43575CF46816B44FD52649EF6ECE87D9EBCFF33874F2B54E9C9E330ED0F38D5D
        905F8A6954F5F268E30B78DCEC5967D14DC14D05EA261E124E55FB8401CD6E7B
        6960CB8321008CFB785DDFE53FFDF27591126E662743CA5F21819109AC97B7F5
        BA01AB1120D5802A630C644679E1AFFDEAA245D8C08216E22B88D851B84E6FE2
        9457B083C7AB3DDE6A14E09E66B170F842251CCCB573E1EA445B60D39F9B23E8
        DA35CDA6EEE6C0F4C98A86F71F6CC4C7967FC5055D66ECD4FDDDC3C164C73252
        5F0E048E85E03364DE3871421DB37AA45D4672874563FB38420058B6FB5CE2AC
        255B77FD5C4C5388109806B566085C25333012CC2C80ED944F9B0590549CFD89
        267EE78636074C18D8083AA6D702036A83B940A9035D60CE69B0AA06F0884E4C
        AF2C4009BC2FC807CC4A5A28DC86679A41BD18131FDBFB5BF261CEC6F3BC233C
        FFC15BE0F6AC180EC0ACEF71CEB0219BD7FF288B013ED3673B9B09B2E9A8AC75
        96256A57D223854F7B36491D3573E41D6A08006C7B64FA570B56FD5CF5B85B32
        10C6FA445699158D4059498C598520045885560B243A307CD6CFC0623BBB31B3
        20443E2ADC04B3EF498296E97110267A215F0D835E5377E1E766EDF1825601E2
        208096BA46774A82B13DEB729F2E77CA70FB9C03089C07EA4549B0795C073E56
        B7AC42FA4BEB01F49AA0AA7A7865C81704D9AB9767200F95907D9A05576587F4
        C8912B270DFB2A50E620005E59BCB5C5E22DA7B715788CE198F228B226C26B7D
        AC304A85506E40B474496A748B3810BEF489C24518298C1F807EDE2402CA550B
        7499B20D3C066B285FA05ABAFA5BFFFA30A4B556FC9CBCF20C2CD973910BE42B
        8D3301DFDF980333569F0E203DEE1A7D021604B53239BE57EB85C3A1277B37EC
        F6ECDD9DECD70460FE0F870D4BD7EDFE717F1174679A97585158D0EA6C8A60D4
        0A24017181F50C849A0D52562A17023A45A0718848A518C6DFDF1432336AC108
        F45B3B66905006A11116239ADE843E29B0EF7C05ACC1DCCCCEF5BE2516899246
        88D81CA7DD942D70B1CCA50BCDACC81504006780E8164441010C8ABD792DD3E4
        6DD386CDABF9CC9069DCF8F92B1E5CBCE7D23FECAA01ED5EEBFCB092B84A0C7E
        73D762037076C8B6EA3E81AF5F580D00336CD6BFF7A2C0C42040AC59802BE532
        9F53F01E6960574807C06F11AC4182012D3EDC80A6DF1E2C460DECBF7E73023E
        DA9253DD3166B958B780C054A8626A64F5F1288BBCB7499D8841DFBF3234F786
        00B0F2D86D9396AC3D967BA53B6F5F1191689198F83981AFE303AC634484805E
        A0C0EB87BE35031C1CD62DC2CF65FCAE24C86050593AB480B6708E33F7EA0E11
        51FDDD21CD25B4CED0B7CFB686A6756DFCDCBEEC2B3060EEAE20E1B55A8047EB
        0BEAE6AFD50759BBDDE56C6023AF774F4F9C31E7D901CA0D0160DB88B7BEEEF8
        FDF12BDF95C8D6280BF5504E0C44AD25EE6B8AB062A0C0CF05B4C61850D4E83F
        D64012F84227F615894579A667069CDE29E7D5041D019E05F45169EBA15835D9
        039F8F6A039D3262C18381AFCBB48D905B6C0F6E8BA3DC5E7C8051F6F252B89B
        056F99E51D09120C25BB1A271887AC79FDF1F35793F5AA001C2F758B2FCE5DFE
        EE4F39EED1488C8819414043202440501EF56B748C3500421BA67CC9A0BE28CA
        6719816B067D66AFD26005A9FA0289606D533DED059E63ED77747559E65A7708
        0C0011C2545755460C1DBDE7ED2716C335B66B9672167EBB33FA9D75C7BF3B5E
        11DECE40DD6CE9AEDEFAAE76012206AF0DD0D6055403E0B30E55AF1B060A1D0A
        00B78D6000980540E81AA15000906AB3EA2FE67C2FCE655C824C24B4862656F7
        92E553873C941C13AB5C4BCEEBD6B2064F5FDE75CF99E24F4ABD621AC52CC0BA
        9E41028B52900BB04DC4C018B866405B2556BD4C2C78B568F0E65B21E2B708D6
        DD01B90600AA9EF7AB4BE07C1ACCFA83329BC932502A2049701EEF9C59B7F3A7
        1307975D4FC61B2E93BBFFB5458377E53A675F914D7544AD35ABB5CAF5754250
        4358DFA2091EE48866FA3448F3D77E2C0D582AEB5F28A1BB80FF9C6F511455F5
        F500DA7B85B08CC1A497499CA1BCB077036BEF0FFFF2C4911BC977430046BFF3
        4FF16241C1733B8B845764AF1421B379AE2412235B87200AFA32185FC7183825
        267E4DEB718188FAC3748BE0450229E8E9EC5005977E55C01A2185AF0AE28D4F
        A2AF155218A82CF23157606B01D89C1F444A642F89A665A52D93ADFD574D1BBD
        F346B2FD2A00D8B66CF761C3DBDFEC7FEE7471C5CB55B2CD268185CABC69A4B0
        C653F0121920212EE05B1116B44E902F8AA4414351A92BE8B95CF36AE8622841
        377F9E3758D94B07268A382E36AE651CF9E3ACD1DFFD1AB97E35006C9BBD62BD
        F4FD81DC31C7F33D93EC8A355EC1E9AA4865AA51800061039821DB3482149C01
        34E984EA3CE83B05DEA0677222442114001607F09E5A33592144F5D248623FD3
        38C9FAF88F33466EFBB532DD14006C9BB96CABB0F67076DF5345156F791CC606
        2EC9C4D44E892E19273D3500F0154F6A063F4282D7058568FE3A0078990BF090
        A110B3D7A9C69AD4CD69F19667D6CE78F4E79B91E7A601F06D0FCEFC22EBE099
        E22997DCD6BE3898B0C01561D52C50E37902D19AAC9A860383E1B501D04FEA41
        2F78D1146A9CE99CB06973187595A584C90B5B37887BFD83978696FC16597EF3
        2F4606CC5E6DBD7CA178504169E5F862B06628480ACCDC87996F8B1A9BF3AD21
        F43F45FF990C234724A0AD48F5B5A354A3C6E05B2DA2793767077C3D113ABAA0
        B8F19692122FB90EA4C599C7C5DA2CDBBF9C3CF437FF98EA5FFECD50BF099FD4
        3F5FE17DACD8A93C54A948A96EC1CA92024E80142A529511483E91A23E2608DA
        4F63049CF7137F00D08890A283E3C3816AE9406B7BF1DF2028AC83FC7392C135
        B75972D4B245138694FDA641FF3B01F06D77BCFC69BDFC0AF9E1A24A3AC8AD28
        19181EC36462E0295052F5A5F4A03986DFFC050ADA7A06DDC4B9C03AC1D141F1
        B23E25288E5A5071B6510C99FEC39B63969040FFF9A300C0B6CF56EF202B0F9C
        89B9545C9AE955857E95601952502EA77970F6C7D611F1DE9C8F4C81F6131855
        D1D5CDA7DC025FE9C58AAC6C8F8D30EF4BB77A3FBB6C77FFB06FC6A06C4344DC
        1FF37783D7DBDEFAFCDBD485BB0B3B29B2B769854B4E315BC2629D2E8FCD252B
        66D4B420A192C38C469764902A9D9515156949B1275C6EF7EEDD739FD88C6055
        FDDEE3FBDD0108DC86CF5A4250CBE22F7985626E894BA8727B21D26AA6290931
        4AFBAC6465E6F09EBFF9E76FFF1300FC11B7FF07E0BF3D80FFF6F67FBBF53A22
        C58965E90000000049454E44AE426082}
      OnClick = SoundHandleClick
    end
  end
  object TimerVid: TTimer
    Interval = 3000
    OnTimer = TimerVidTimer
    Left = 288
    Top = 336
  end
  object MainMenuBar: TMainMenu
    Left = 363
    Top = 334
    object LeaderBoard: TMenuItem
      Caption = 'Leader Board'
      OnClick = LeaderBoardClick
    end
    object Help: TMenuItem
      Caption = 'Help'
      OnClick = HelpClick
    end
    object About: TMenuItem
      Caption = 'About'
      object Author: TMenuItem
        Caption = 'Author'
        OnClick = AuthorClick
      end
      object Game: TMenuItem
        Caption = 'Game'
        OnClick = GameClick
      end
      object FireFlyshow: TMenuItem
        Caption = 'What is "FireFly"?'
        OnClick = FireFlyshowClick
      end
    end
  end
end