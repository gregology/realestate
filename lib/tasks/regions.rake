namespace :regions do
  desc "Create regions"
  task :create => :environment do
    
    prince_edward_county = "ST_MakePolygon( ST_GeomFromText('LINESTRING(-77.15278689223894 43.81692450051234,-76.76414973513963 43.9311656223183,-76.84638640240468 44.12706534128443,-76.95781960593069 44.0609322760221,-76.99816921764838 44.04487533576555,-77.03239759987196 44.04065475030288,-77.09288769091404 44.0488303238205,-77.11733461601229 44.04304668767801,-77.11037678693127 44.05677520056156,-77.09062251536146 44.07480014974021,-77.07576124966545 44.0962036261315,-77.07299423988015 44.11600202402476,-77.06595113397037 44.13542942057799,-77.05543658068333 44.16340811725143,-77.04845873621879 44.17934204776876,-77.05411339928712 44.18570599284728,-77.08863490977154 44.1725732602382,-77.11470977695798 44.1672828576047,-77.14031224338177 44.15815160330263,-77.18824825239817 44.15273673861035,-77.2372818443072 44.15093030671276,-77.30105460683833 44.15008932357954,-77.34591853475116 44.15156176027375,-77.37763660003725 44.14756333892132,-77.4496983994657 44.12302255389384,-77.49885860533171 44.11029690881971,-77.53479185612902 44.0866122481198,-77.58056988838021 44.06130034873489,-77.67765990813355 44.03190915505701,-77.69445229337711 44.02684587223976,-77.69476698665589 44.01764517241357,-77.68261044724657 44.01080897859769,-77.62686781457349 44.01853540816694,-77.54880080239656 43.9374023108411,-77.53321838284356 43.89822054281536,-77.33712577025014 43.93817610865837,-77.23654381838092 43.82620866305203,-77.15278689223894 43.81692450051234)'))"
    prince_edward_county_non_coastal = "ST_MakePolygon( ST_GeomFromText('LINESTRING(-77.52358877330249 44.08113541191877,-77.52634471032658 44.07988532977147,-77.52918777604135 44.07855580843211,-77.53008453797788 44.0784731864771,-77.53080305287766 44.07921101381403,-77.53177663779837 44.07938005638906,-77.53276014061377 44.07931032367509,-77.53562896586223 44.07840627225906,-77.53869449642198 44.07713012109794,-77.54011591013955 44.07650856849613,-77.54122640863984 44.07578511783854,-77.54394535012602 44.07375203982603,-77.54637752270082 44.07197752755289,-77.54722260140611 44.07051017407584,-77.54734927632549 44.0690890907178,-77.55046163167125 44.06762501297894,-77.55283639634958 44.06643704698649,-77.55539424036328 44.06542238754547,-77.5575261490719 44.0644053524153,-77.55981747363424 44.06317414417033,-77.56245113149659 44.0610988447341,-77.56578552397488 44.05843694226856,-77.56883905968739 44.05521137280532,-77.57203794926092 44.05230127415314,-77.57518104589057 44.05090146528233,-77.57735887908164 44.05118051560466,-77.58000176069446 44.0516247684282,-77.57959189270068 44.05472749858941,-77.57933105891141 44.05559743200001,-77.5812716727423 44.05615711917485,-77.58245615727967 44.05439753622561,-77.58939034867844 44.05554320958141,-77.59190078356227 44.0542282004356,-77.59322988029581 44.05464690344462,-77.59559458004357 44.05582439973548,-77.59656980080777 44.05534683624845,-77.59508209355901 44.05427754336277,-77.59809625913799 44.05336166804708,-77.60024432994263 44.0546505058886,-77.64807872897603 44.04001196157424,-77.64810465973443 44.0386810899336,-77.65380174624929 44.0382635501919,-77.65966873620424 44.03648410247713,-77.6558756990426 44.02920734682991,-77.68647577674463 44.02318283122989,-77.68557740805673 44.02110035139039,-77.67891924111302 44.0230031184178,-77.67393537084182 44.01929227059404,-77.67241634433275 44.02446854841044,-77.66746959498005 44.02412885078571,-77.65844168435375 44.02582399216623,-77.65770477431526 44.02400823295158,-77.65957769171037 44.02377995250521,-77.65878481308226 44.02154453646693,-77.65682637339469 44.02187143702452,-77.65664378510792 44.02157719844388,-77.65416253089568 44.02172679424392,-77.65628568636659 44.02720626867534,-77.65387686754423 44.02759833452363,-77.65201284669041 44.02362089958517,-77.65168035722022 44.02268021156743,-77.6511098881749 44.02207761702971,-77.64626783544615 44.02292952745881,-77.64430801205076 44.02416835541138,-77.64163727292394 44.02069844034911,-77.6405650336156 44.02074461064077,-77.64037115103567 44.02025166938,-77.63967613752577 44.02042858318804,-77.63893842670514 44.02059240679448,-77.6319984881676 44.02261176441818,-77.63232956176944 44.02315566352269,-77.63272784573148 44.02304549617622,-77.63564821087367 44.02930420439629,-77.62980490930991 44.03145419985692,-77.62780133808724 44.02712391505728,-77.62655787490885 44.02754033973297,-77.62519657227628 44.02802553154336,-77.62535955168444 44.02823925080945,-77.62569491525593 44.02824533263,-77.62586730288884 44.0281810636704,-77.62597094999062 44.02848619775901,-77.62563678403011 44.02874223588362,-77.62532187306863 44.02882234704671,-77.62599865553912 44.03036361980171,-77.62706789349565 44.0335575387641,-77.62672034265623 44.03359854629655,-77.62595794912659 44.03317354825727,-77.62318466500207 44.03356469155734,-77.62490126280282 44.03851122705716,-77.61586256200231 44.03967506203497,-77.60750359531167 44.03902315499714,-77.60542653472362 44.03962111285794,-77.60574350502756 44.04028876501701,-77.60500075731663 44.0403147736878,-77.59837121520188 44.03842432989138,-77.59377439792523 44.03667691589772,-77.59134566740137 44.03525300642657,-77.59255998008273 44.03403216639386,-77.59206038339057 44.03365160620289,-77.59324704145388 44.03234886775004,-77.59089301227712 44.02915980159568,-77.58981019476822 44.02899234169473,-77.58828934527676 44.03148546315487,-77.5840395424152 44.02945969438088,-77.58523663442246 44.02830128255044,-77.583803797741 44.02752336220317,-77.58138556464171 44.02966895529236,-77.57411974832357 44.03153833856329,-77.57352619302506 44.03221365049268,-77.57299398829342 44.03206003949287,-77.57245431544762 44.03205572547741,-77.570673586732 44.03218561766735,-77.56937948223077 44.03193194113703,-77.56854973926953 44.03172235348629,-77.56778616640783 44.03133542960047,-77.56837932810544 44.02992645363945,-77.57353606915156 44.02554443381875,-77.57236590863991 44.02376226177935,-77.57873453666441 44.02022010588365,-77.57959657105785 44.0192280929227,-77.58037998369616 44.01874219439583,-77.58094415860589 44.01859840256909,-77.57994947962892 44.01762820705209,-77.57929316862521 44.01753635870001,-77.57845647079043 44.01688459005564,-77.57815683592705 44.01654253631156,-77.57766758057559 44.01641743515532,-77.57619719834054 44.01647459270064,-77.57310326351093 44.0172249557456,-77.57147709122192 44.01685873106477,-77.5698779550837 44.01442353176691,-77.56919091708004 44.01248527024513,-77.56876479689403 44.01180510870944,-77.56865759529545 44.01135658293948,-77.56882098771734 44.0108264065807,-77.5693687717161 44.00981162284751,-77.56911405880722 44.0093939564157,-77.56859799511524 44.00922658997645,-77.56786460299985 44.0091298214173,-77.56700257949099 44.0091870901561,-77.56456636300003 44.00993315442243,-77.56233568035145 44.01074267844778,-77.5600204194722 44.01333950958523,-77.55785089028358 44.01578913911504,-77.55145991335844 44.0133386078545,-77.54683922844238 44.01158061088768,-77.53855770652659 44.01091270821731,-77.53395609939751 44.01160798809557,-77.53092998042183 44.00884007629726,-77.52979538790925 44.00793711957147,-77.52851701111031 44.00714808761513,-77.52491473825917 44.00550443750154,-77.52180249301244 44.00429300353824,-77.52029538834769 44.00345928843107,-77.51971470941648 44.0027807066658,-77.51937526470702 44.00218292348896,-77.52079203931083 43.99735706601346,-77.52116209996393 43.9963464388174,-77.5234837832632 43.99682809838512,-77.52422542787347 43.99606459643575,-77.5232119374062 43.99595750200988,-77.52177951658193 43.99512238425756,-77.51983028680596 43.99641760550153,-77.51948488680156 43.99569010780252,-77.52200082735098 43.99334719955829,-77.52591838233643 43.99400255440761,-77.52823199410903 43.99352098045121,-77.52647059928553 43.9916212547142,-77.53048771059726 43.99008833036458,-77.53132255125438 43.99164369802151,-77.53533837554316 43.9896410618783,-77.53400100308264 43.98843644772379,-77.53707002954307 43.98721482876923,-77.54732622294559 43.98651419958647,-77.54913195494589 43.98589086627715,-77.54997206085412 43.98711264743703,-77.55351101936563 43.9857598129063,-77.55640664568175 43.98592300492176,-77.56055444419943 43.98439026510388,-77.56696626505804 43.97730837078753,-77.56149828011054 43.97244669012994,-77.5446639739824 43.97034359609739,-77.53137805543408 43.96778005161826,-77.51876326787709 43.96701347337657,-77.51713702196189 43.96456770265792,-77.51684703747624 43.9607955792964,-77.5191610219032 43.95704904380719,-77.52085919320739 43.95410840657603,-77.51821716332849 43.95083126157176,-77.50285413649935 43.9588610248625,-77.50321603590059 43.96003480096041,-77.49727785648287 43.96206504739333,-77.48493160394345 43.9645840918572,-77.47976892057973 43.96016751984981,-77.49049203923545 43.95413491902447,-77.49800364572276 43.94626921163042,-77.49142055289393 43.93733265422976,-77.48946393737056 43.92776035916027,-77.47469747183214 43.92976582245476,-77.4605775408556 43.93052344706687,-77.4556610226573 43.92901067933627,-77.45176046953566 43.92846460843937,-77.43951742146041 43.93096133303846,-77.41774578995242 43.93747708836234,-77.40977037908355 43.93741838048589,-77.39995359792529 43.93769890906131,-77.39224170487641 43.94017068473586,-77.38055065410123 43.94329776172529,-77.37891003308459 43.9437745728221,-77.37842231470029 43.94302201928267,-77.37361721173053 43.94444444980707,-77.37410295616741 43.94595045758864,-77.37194072529989 43.94667906664153,-77.37120839548027 43.94567549811578,-77.36967304670216 43.94622819283329,-77.37012730884067 43.94733088354941,-77.36747642727023 43.94828622564878,-77.36062134464576 43.9498105747988,-77.36028127966813 43.94904393568745,-77.35897701042438 43.9493538311141,-77.35930610604862 43.95009399145432,-77.35367538352396 43.95149533689782,-77.35347201983289 43.95145120878382,-77.35295771389204 43.95039379492032,-77.35181770631783 43.95074654844164,-77.35029999612144 43.95088717076911,-77.34789717356055 43.95097274987508,-77.34807666347112 43.9517657050943,-77.33844627578149 43.95226250690786,-77.33571373828738 43.95283183133053,-77.33208186616264 43.95420065769593,-77.32807842602065 43.95551657106023,-77.32281963882471 43.95743764153578,-77.32093566489279 43.95804067962384,-77.31459494904023 43.95974904620645,-77.30875448591379 43.96001391470428,-77.30292741169292 43.96019723947636,-77.29874871996311 43.96042375850106,-77.29686599639832 43.96063548786149,-77.28793484843651 43.96375142808957,-77.25416057594464 43.97231679582424,-77.25402090916933 43.96397275616856,-77.2385937163844 43.96782861684507,-77.23293745269139 43.96660449959787,-77.23270909357527 43.96576987272699,-77.23361828937556 43.96532703613648,-77.23770136109552 43.96217256124683,-77.2391106623261 43.96122935618532,-77.23968984490973 43.96025020233759,-77.23948442125904 43.95766392949948,-77.23787881166399 43.95579948745694,-77.23716708491456 43.95501764524828,-77.23678146335858 43.95409107878395,-77.23761151837147 43.95234560651591,-77.2407297936404 43.9527554854874,-77.2419352033058 43.95339852695021,-77.24389216062337 43.9546574674678,-77.24672152773191 43.95227231144143,-77.24747712520613 43.9521822836093,-77.24781407647299 43.95133389216016,-77.24508588877278 43.95197457780353,-77.24200691775296 43.9532957174583,-77.24072960083731 43.95260079923349,-77.23772214821514 43.95187445453116,-77.239943340696 43.94622335856073,-77.24782075415571 43.93933125661651,-77.25161098625632 43.93565463744252,-77.25601237866289 43.93042079332993,-77.25844412429993 43.92687673203996,-77.25994951197431 43.9246136186938,-77.26293129489714 43.92141942398511,-77.26575337601356 43.91848738059034,-77.26691022076437 43.9171389876967,-77.2679791838637 43.91543629185933,-77.26892272428127 43.91372586432036,-77.27048422355178 43.91408173111163,-77.2718247191634 43.91221445292561,-77.26965548368828 43.91171582515891,-77.26976497459998 43.91120583636404,-77.26995319192584 43.90948312697807,-77.26918700606728 43.90856064468259,-77.26471104532813 43.90733205464887,-77.26263492161431 43.90680896930578,-77.26213533653288 43.90728900607714,-77.25811241063425 43.90657434623824,-77.24763787191397 43.9040783686173,-77.24626481306213 43.90644171268689,-77.24382358339776 43.90791554672074,-77.24452095006242 43.9100265818708,-77.24161426176651 43.91145404150249,-77.23483462207768 43.91677142446883,-77.23215936426662 43.92012718227475,-77.22890152519047 43.92218053713246,-77.22595432302214 43.92321821367447,-77.22156573110536 43.92395968452561,-77.21093967508808 43.92810679872348,-77.19833382153875 43.93441921290304,-77.18936450810867 43.94017695136861,-77.18361564439014 43.94579628893539,-77.17638955847377 43.9514719050112,-77.16487291667333 43.95803366970731,-77.14980027931145 43.9383781481274,-77.15361672382485 43.93682159812369,-77.1570750154533 43.93541236872338,-77.15676933740204 43.93467488772005,-77.1587194090189 43.93366895521372,-77.15938298936467 43.93452202716959,-77.16286381183382 43.93294304506622,-77.16200374834222 43.93189861974824,-77.16727398500085 43.92891374045014,-77.17195272391425 43.92546559608577,-77.17352974303274 43.92742946094459,-77.17887837259464 43.9254023446211,-77.18016804890246 43.92650138457913,-77.18171073427472 43.92520295966878,-77.17977045825519 43.92352066241973,-77.17973270168302 43.9228826348383,-77.17909599485496 43.92236334876439,-77.17789538319074 43.92108164230948,-77.18160648771358 43.91853864276109,-77.18476157514729 43.91631230993459,-77.18547589963264 43.91527683080062,-77.18590286447252 43.91366679139143,-77.18632865364084 43.91272159485215,-77.18730583753322 43.91171723342109,-77.18988130670918 43.91043568814975,-77.19207177249812 43.90917955634881,-77.193719256642 43.90815246833176,-77.19518608102405 43.90702726558661,-77.19574527522849 43.90630762409812,-77.1960505796991 43.90550390220196,-77.19660016133324 43.90381970233013,-77.19703243382267 43.90237341287851,-77.19705512002199 43.90150379792076,-77.19686977367051 43.90061109586532,-77.19663819815803 43.89945167523943,-77.19696438065131 43.89794494040724,-77.19756494956924 43.89620747730577,-77.19800156041615 43.8953137125329,-77.20029819315708 43.89692134082332,-77.20203809812661 43.89576222785843,-77.20285056031172 43.8947614290093,-77.20238305914128 43.89412674226073,-77.20103571497621 43.89513703332455,-77.19936901851194 43.89402634459478,-77.20276352687611 43.89150032360745,-77.20645237303688 43.88907035695844,-77.20860910896414 43.88780701069636,-77.21029321806006 43.88847735678589,-77.21310934272066 43.88575267501411,-77.21043656002014 43.88429942931237,-77.21035405859347 43.88248834793795,-77.22742656729793 43.87083906244379,-77.22019871229396 43.86291454436219,-77.20823424487617 43.86737705707029,-77.19918366949834 43.87084206618108,-77.19163884890939 43.87654110455534,-77.18777555902022 43.87816687802934,-77.17550888590191 43.87337684907049,-77.15837870900442 43.86817187240427,-77.1564599184178 43.8586533231093,-77.15529142198804 43.84579660997336,-77.14020950440343 43.85284605413867,-77.05583893575266 43.89481787124907,-77.02966441405999 43.90231590800847,-77.02022656236699 43.89794259746856,-77.00593736643269 43.90789289464318,-76.98171683890222 43.91848010954459,-76.9329862280813 43.92836996877847,-76.94219969768088 43.92918151052002,-76.94653912989757 43.93005695439735,-76.94873131498753 43.93167718746859,-76.95042610038691 43.93109633314663,-76.96229209199512 43.93876730469663,-76.98134232853364 43.93185233629475,-76.98777706121204 43.93192772678725,-76.99583229416798 43.92908345168885,-77.00254028857631 43.93357228170655,-77.0067931545326 43.9342081210019,-77.0094892623198 43.93582143826805,-77.01487237035555 43.939339894278,-77.01649078552497 43.9405144390496,-77.01805734689391 43.93884658067105,-77.01881522523105 43.93752957714945,-77.01440579782275 43.93480988146443,-77.0179353337648 43.93323393370829,-77.01860803245749 43.93127912586598,-77.01974766748124 43.92652257720334,-77.02148868217218 43.9195552165551,-77.02599665603627 43.91681656191463,-77.03082256017176 43.91392625837462,-77.03513521716673 43.91121486830446,-77.03732609065305 43.91051763436014,-77.04145103378555 43.90918599420308,-77.04337649126963 43.90903310539864,-77.0450440558018 43.90988259588539,-77.04639565489651 43.91156065707634,-77.04920780387438 43.91396484264836,-77.05158742236503 43.91662503503418,-77.05262239442476 43.91824591611463,-77.05319612393983 43.92004277310813,-77.05376944108674 43.92222901035402,-77.05375656068064 43.9235757642318,-77.05312978985012 43.92426385467205,-77.05070701623018 43.92602499843309,-77.0489607227648 43.9277231247347,-77.04565243891599 43.93122921073125,-77.04540560044127 43.93190494483464,-77.04544418186504 43.93295424902098,-77.04454896190688 43.93305940186952,-77.04345540040759 43.93397473524431,-77.04802215091856 43.93670602461181,-77.04789622540962 43.9400141267357,-77.04658581845945 43.94470584584072,-77.04781109907128 43.94797571586992,-77.04710879519635 43.94963000166827,-77.0428572327103 43.95319752559063,-77.04049262749562 43.95599447960503,-77.03898769387041 43.95905419701541,-77.03745354757389 43.96133003588403,-77.0355966707632 43.96351885544615,-77.03446447670676 43.96578757220453,-77.03408867508462 43.96774878412377,-77.02983042681637 43.96879037343852,-77.02665729531469 43.96976244657871,-77.0231854866785 43.97102372299428,-77.02014404567609 43.97346129232044,-77.01779255485643 43.9761558963353,-77.01485433566894 43.9778765423141,-77.01182967067952 43.97947819537652,-77.00611450961503 43.98288135114494,-77.00939705736816 43.98576844367436,-77.02757656187394 43.97524003736851,-77.03905750490053 43.98613443562439,-77.01961227400278 43.99947762947357,-77.01624433026093 44.00115195590379,-77.01492331255207 44.00267743421124,-77.0133511041544 44.00343352399224,-77.00884512164166 44.00451469967877,-77.00708724192627 44.00536634305902,-77.00537794541619 44.00570551177154,-77.00353140955009 44.0040516640838,-77.00095866503536 44.00160728055101,-76.99281642388789 44.00500885255215,-76.98606314572139 44.0082238040448,-76.97147216823872 44.01515566246207,-76.96599572591262 44.01794339045819,-76.96070975538235 44.02070189011492,-76.95499028110945 44.02413408191462,-76.95154202238115 44.02470942823736,-76.94205822467863 44.02505917581247,-76.93556388720846 44.02592644571584,-76.9298067616153 44.02893103665612,-76.92320244911566 44.03071230104767,-76.91916648330263 44.03080128456244,-76.91508623129582 44.03098682687592,-76.91210037444664 44.032041289076,-76.90898301485812 44.03285996977682,-76.90782958413872 44.03422740660518,-76.90633732632747 44.03663332209842,-76.90542970426942 44.03938297438641,-76.90399654676692 44.04224634494739,-76.90509321609035 44.04724481468246,-76.90308531299605 44.05219307604857,-76.9007297784937 44.05707531629339,-76.89730337547091 44.06050288181265,-76.89559991846293 44.06228779667691,-76.8938357440162 44.06375011566884,-76.8904157455941 44.06533018890799,-76.88873428042204 44.06770809869372,-76.8778470449176 44.07259654521096,-76.87230347833572 44.0763534568586,-76.87179201681023 44.07781291003869,-76.88088685902771 44.087566797111,-76.88253872093482 44.08775785149148,-76.88492304231951 44.08777543998496,-76.88609084253967 44.08847465106098,-76.88701690309941 44.08961298177448,-76.88568387832886 44.09109735832897,-76.88777141472545 44.09324024700473,-76.8857602952436 44.09410957030781,-76.88386320375373 44.09590939179464,-76.88163511856499 44.09550531006547,-76.8844125825926 44.09833090525287,-76.88551286348977 44.09547475095077,-76.88952048501881 44.09413575929324,-76.88978377026511 44.09130670208881,-76.89120863252757 44.09103310818822,-76.89540171936399 44.08864817601754,-76.90007990209469 44.08608958921388,-76.90069290539512 44.08538761655366,-76.90139290659469 44.08364548487434,-76.9024173259976 44.08235040599394,-76.90356032676407 44.08158165714995,-76.90502415362761 44.08101953617059,-76.90960305369529 44.0774115771782,-76.91689326450258 44.07380511421992,-76.92355254590447 44.06837033915685,-76.9271252598266 44.06538578096131,-76.93039452487325 44.06234648423693,-76.93022513904391 44.06138952713624,-76.92735357370896 44.05849563901375,-76.92728581104888 44.05713068677185,-76.928225506934 44.05622172392959,-76.96040336779348 44.05043510012373,-76.96695240939188 44.04814255496233,-76.96898531032292 44.04714474338084,-76.97430571940049 44.04457288854974,-76.97844145559888 44.04202829903389,-76.98085883417936 44.04073489206001,-76.98352067660282 44.03961882974646,-76.98954096798012 44.03844405157112,-76.99629689202234 44.0374571494807,-77.0077863014497 44.03557803252571,-77.01325877179285 44.03500140876803,-77.01611272354567 44.0337083015157,-77.01884092268276 44.03200256532572,-77.01973111751735 44.03022906677231,-77.02105028752898 44.02944961004548,-77.02264247190335 44.02939898595331,-77.02646417396389 44.03058880837285,-77.03019070275568 44.03089944886571,-77.03565864726659 44.0340340516485,-77.03803237287971 44.03457888133496,-77.04400851050852 44.03534391924049,-77.04713251328479 44.03553506124095,-77.05023462128936 44.0359113195949,-77.0567634048805 44.03967707995974,-77.05946432917068 44.04135561311689,-77.06330187807102 44.04253225490072,-77.06780676942424 44.04287803684074,-77.0713691332476 44.04354625559564,-77.07479571475926 44.04430179229541,-77.07761968413294 44.0440360608486,-77.0876929205711 44.04454736063757,-77.089817234121 44.04433585673173,-77.0938010883535 44.04266073758141,-77.09696861042933 44.04264625594804,-77.10011788331857 44.04211386287756,-77.10600499939548 44.04050711333768,-77.11147099280176 44.03786110501242,-77.11760165716871 44.03429022384468,-77.11862367529589 44.03272911776153,-77.11837155875247 44.03020775479932,-77.11898099521203 44.02767764485643,-77.1196610782612 44.02534108235493,-77.1212944199294 44.02301620559506,-77.12382971119386 44.01998721729547,-77.12474064928253 44.0181221595242,-77.12601465495311 44.01631939201487,-77.12751885150658 44.01443683021897,-77.13206284656854 44.01028943670077,-77.13336383090628 44.00951533399591,-77.13467719703139 44.0089556851632,-77.13597909629281 44.00861233704497,-77.13917980511046 44.00855541431554,-77.13465734589654 44.01486198925394,-77.1339940344408 44.01612337573192,-77.13632610678042 44.01655232197394,-77.13578712794765 44.0184123854351,-77.1354927657425 44.02596124259005,-77.13869129782375 44.03153438966658,-77.14245982020471 44.03716201388423,-77.1373736781909 44.03584682103536,-77.13507376321317 44.03734010835258,-77.13289970491003 44.03932576488072,-77.12893325204651 44.04358708119062,-77.12651279286037 44.04683277266655,-77.11750570479336 44.05719420701548,-77.11423248331057 44.05949715138549,-77.11212724177436 44.06181529930201,-77.1105510037133 44.0643410181444,-77.10968146181578 44.06662277222045,-77.11004303936704 44.06704430461323,-77.10545526312531 44.06968789053955,-77.10102708188394 44.07263880008009,-77.09757879384385 44.0752736261422,-77.09661243599584 44.07625583465408,-77.09617929507448 44.07674927682915,-77.09494643955873 44.07900677147853,-77.09340177109186 44.08186310970118,-77.09029733805359 44.08752622109149,-77.08813681639013 44.08909531724863,-77.08564038778907 44.09082117263943,-77.08478571518441 44.09171805096236,-77.08417551282363 44.09275755359364,-77.08381486715581 44.093718711798,-77.08366295126791 44.09482871895447,-77.08425078085634 44.09805299706989,-77.0845165036376 44.09966062434518,-77.08465241696194 44.10122852739943,-77.0839446169775 44.10147883271834,-77.08258846078948 44.10247033194906,-77.08203787311552 44.10347899075559,-77.08165650844421 44.10472988643765,-77.08139833510336 44.10631825175522,-77.08175763778964 44.10720291074902,-77.08285713188931 44.10896866179295,-77.08404733110522 44.10997646653621,-77.0846931536138 44.11016320751335,-77.08468591869229 44.11126365013217,-77.0845083029799 44.11329672139096,-77.08459973111691 44.11535216437909,-77.08422901549405 44.11539720563425,-77.08326050087193 44.11580969438047,-77.07784452188308 44.11884759876309,-77.07671163197369 44.11958893162726,-77.07625156296129 44.12004014716528,-77.07580463926455 44.12067810290483,-77.07558362558026 44.12303983681765,-77.07511165324597 44.12462895729249,-77.07515497536025 44.12521016097356,-77.07554950421876 44.12682938927504,-77.07589366097912 44.12739322693886,-77.0763496431572 44.12789151666023,-77.0768099946974 44.12841247447823,-77.07702420420685 44.12897065073041,-77.07620992649093 44.13122951643546,-77.07520275814468 44.13335260957562,-77.07484918352878 44.13383781965327,-77.07322099128504 44.13501333316414,-77.07256488566213 44.13555318006649,-77.07198471909783 44.13621230224263,-77.07156995963366 44.13676400187481,-77.07141360147371 44.13731151604055,-77.0716005019153 44.13788048560135,-77.07203172396959 44.13843088053848,-77.07264713659696 44.13918760512839,-77.07271498057382 44.13966311193349,-77.07211799706198 44.14151837950523,-77.07093082243374 44.14346498054819,-77.07039818252186 44.14597643622314,-77.06991973914364 44.14672125811757,-77.06905736205276 44.14790927784719,-77.06774871037754 44.14984112130647,-77.06749356672334 44.15034946620629,-77.06758144636086 44.15138189630022,-77.06905555856363 44.15292084005274,-77.08407735753026 44.16852239921073,-77.08524793462178 44.1693701657401,-77.08606095668878 44.1693539170554,-77.08831927419456 44.16841763867459,-77.09138872868068 44.16685975948489,-77.0946538402813 44.16536616799597,-77.09724655685635 44.16424700548594,-77.09983834751637 44.16333276289708,-77.10232666607936 44.16265423607838,-77.10701540515011 44.16207131342003,-77.10926776495772 44.16159907512379,-77.11069091267154 44.16112011315703,-77.11200562181813 44.16058591513369,-77.11392325945599 44.15949119048838,-77.11553381529011 44.15828812094075,-77.11718738552939 44.15740287619445,-77.11999154137723 44.15664036815382,-77.12182256548255 44.15593957997383,-77.12375602901804 44.15548548993515,-77.12598934396939 44.1551677496763,-77.12771026164826 44.15473687142582,-77.12908011080545 44.15410732685869,-77.130693103466 44.15276001174914,-77.13662811498499 44.1498189530791,-77.14717323586726 44.1484533724206,-77.15185725146554 44.14781252404479,-77.15357677104268 44.14785086242112,-77.1578499293759 44.14830360642254,-77.1609979582035 44.14883688119664,-77.16225267624324 44.14886441308786,-77.1658692054299 44.14811066128723,-77.16997040409356 44.14761188235074,-77.17116065813983 44.1473864552549,-77.17228129968473 44.14698768330387,-77.17503860602034 44.14535946025743,-77.17761713164427 44.14372920845184,-77.17954931613721 44.14234052979045,-77.18051051638741 44.14160102790329,-77.1812498504265 44.14064580882044,-77.18188110572 44.14131961260723,-77.18245764397048 44.14105523020837,-77.18156303981462 44.14004009468303,-77.18227978558947 44.13774581806319,-77.18362915084091 44.13517931557348,-77.18485472247971 44.13193083563269,-77.18662302437951 44.12945636591162,-77.18904343492953 44.12719940267652,-77.1922237805295 44.12415774754786,-77.19400010175117 44.12296176882251,-77.19893992048399 44.12068473653419,-77.20439128077625 44.11807425783766,-77.20706615399685 44.11621488401433,-77.2114553670587 44.11308652355956,-77.21309453437694 44.11137695653245,-77.21568754720008 44.10856580445284,-77.21831232733099 44.10693519458884,-77.2215395473585 44.10495700092581,-77.22213314950874 44.10407821950837,-77.23090970531788 44.11016845204079,-77.21251257883281 44.12245334561882,-77.19936926195847 44.13142253760692,-77.1997917049375 44.1382267385933,-77.20417158488927 44.13950046627215,-77.20785263315858 44.13853535355567,-77.21181852305745 44.13801996173821,-77.22567202853233 44.13428727031791,-77.22785180445993 44.13308260169155,-77.23072670746083 44.13233785225145,-77.23572198897872 44.13414103468564,-77.24554687095095 44.13038967935964,-77.24097871782544 44.12110591714266,-77.24646263302883 44.11600232791955,-77.26845483049765 44.10713550620378,-77.28174819489047 44.1049754071801,-77.27800068118417 44.09967205922588,-77.26617657052076 44.10170960742789,-77.24518357811664 44.10847397999564,-77.23136036963497 44.10994922716572,-77.22360507097099 44.10482841884678,-77.21605300413471 44.09621867773674,-77.21678141461406 44.09600870937184,-77.2206259264165 44.09494013554941,-77.22386734077214 44.09408587815276,-77.22709759201193 44.09258362161155,-77.2274501699052 44.09166593670336,-77.22815262312385 44.09055784138457,-77.22671719767109 44.08852079414208,-77.22830454939864 44.08758641383204,-77.2298197610389 44.0867533617845,-77.23152820994474 44.08653687866629,-77.23318467527824 44.08638896825609,-77.23730915550414 44.08574955893821,-77.24573857537221 44.08433958525178,-77.24766171998372 44.08325211158284,-77.24849737305141 44.08304762759793,-77.24941272498893 44.08296785406606,-77.25268571129193 44.08284199124416,-77.25598199600552 44.08295369251841,-77.26283155605856 44.08345053789597,-77.26404489849776 44.08332604459389,-77.27378171316919 44.08162258213834,-77.2747681881383 44.08156938518313,-77.27663256265791 44.08178539131801,-77.27852906072005 44.08184157895479,-77.28017557306175 44.08153357210588,-77.28297373186504 44.08044595500228,-77.28398281598028 44.0800490893023,-77.28508735469799 44.07979945165088,-77.28750367802348 44.07983554646516,-77.29308191057608 44.08071895056226,-77.29443922726321 44.08067359954657,-77.29590697097976 44.08029540378658,-77.29988258072693 44.07853853757522,-77.30375035202789 44.07668943095416,-77.30462730205197 44.07593724954008,-77.30584180606827 44.07389532732335,-77.30750696691615 44.07205001151529,-77.30990919814684 44.07014316366072,-77.31282145526492 44.06880024897342,-77.31588480581638 44.06967614493769,-77.32876895750475 44.07700668192975,-77.37392392263207 44.07792337186947,-77.36628077905152 44.09427352129589,-77.36216611969104 44.10099963435958,-77.33417372004853 44.12356914905368,-77.30938223863745 44.13431257842658,-77.30318213946575 44.1381808176471,-77.30191546357622 44.13883868091726,-77.30023672427924 44.13915527697112,-77.29913813967525 44.13958019384091,-77.29891856986379 44.14005373393273,-77.30136169237723 44.13932216024751,-77.30268897041125 44.13888800691851,-77.3040941365939 44.13809772152369,-77.30573422831287 44.13743047961687,-77.30931720901533 44.13509277138068,-77.31603256762035 44.13764113208899,-77.31482240725975 44.13955176773604,-77.32055049930436 44.14041419875081,-77.32264707881291 44.13821449607288,-77.32692943306715 44.14002287829989,-77.33489838019506 44.13806120466866,-77.34130456481238 44.13689987632649,-77.34775156622621 44.1359089508091,-77.35054182805547 44.13875981570661,-77.34754837418261 44.14105321061029,-77.34656485454018 44.14045907747704,-77.34412744928949 44.14225971274902,-77.34494263427685 44.14286426602778,-77.34758388061582 44.14107869464583,-77.3505933349452 44.13878114035774,-77.35618798397894 44.13669753739053,-77.3614429476943 44.13480073292767,-77.3618793238853 44.13517300144288,-77.3635060153668 44.13412356114518,-77.36604602991632 44.13211973545521,-77.36928690031212 44.12939358559177,-77.37098630264096 44.1305321947295,-77.37214540410454 44.12972603515276,-77.37195838480959 44.12815636608452,-77.3749033136715 44.12739744917153,-77.37763057676153 44.13003723483722,-77.38139860129401 44.13813012359883,-77.38149820040381 44.13931391313226,-77.38164413122703 44.14126366885544,-77.38207665751807 44.14183128159246,-77.38303406135771 44.14216698861721,-77.38450719589373 44.14263728313322,-77.38575714159836 44.14228822837849,-77.38805736170553 44.1400116074645,-77.38840924945073 44.13970687646502,-77.388025351381 44.13935161987446,-77.38747079660536 44.13857014563197,-77.38811673197186 44.13802891752461,-77.3899473859843 44.13694356937567,-77.39217628025212 44.13547186422151,-77.3915923064943 44.13478242513082,-77.3924304052946 44.13414777697501,-77.39887771466528 44.130393754423,-77.40432790936853 44.12756416859181,-77.40599700791583 44.12674391311209,-77.40774059931412 44.12602809538837,-77.41095055209925 44.12516493723597,-77.41412058050953 44.12439599110976,-77.41709601376033 44.12360456916431,-77.42177518011208 44.12187713717023,-77.42493120720108 44.12063907280123,-77.42814426551584 44.11956417568531,-77.43218982062652 44.11846718700959,-77.43635856086561 44.11739577106304,-77.43942321611182 44.1165242913546,-77.44557681334402 44.11470584797658,-77.44778243555402 44.11409147623679,-77.45003347693539 44.11363192940298,-77.45246610664887 44.11340633604029,-77.45540713944479 44.1129695719972,-77.45707962694209 44.11246521876991,-77.45847132947692 44.11203765118935,-77.46009594545907 44.11173460152867,-77.46277882863355 44.11153509946278,-77.46752523254301 44.11112575360024,-77.47089932449154 44.11053146398338,-77.47481808285457 44.10965786861055,-77.47621944297165 44.1091661493179,-77.47916086856711 44.10800455188967,-77.48114454572803 44.10710076418776,-77.48298019854138 44.10614247896749,-77.48540935112527 44.10463259101439,-77.48723957098633 44.1032577546011,-77.48948050462143 44.10145293468941,-77.49189245153163 44.09964358125153,-77.49266599216379 44.09915928899986,-77.49560725641335 44.09801368803181,-77.49882840791138 44.0964708391626,-77.5014479999937 44.09494967543052,-77.50393763746493 44.09314816976797,-77.50614458842136 44.09151373838761,-77.50836987054203 44.0899129708274,-77.51068962086491 44.08824653748773,-77.51312522591195 44.08672278215867,-77.51840416640795 44.08394788669155,-77.52096551477486 44.08244970594721,-77.52358877330249 44.08113541191877)'))"

    prince_edward_county_coast = Region.find_or_create_by(title: 'prince_edward_county_coast')

    sql = """
      UPDATE regions
      SET area = ST_Difference(#{prince_edward_county}, #{prince_edward_county_non_coastal})
      WHERE id = #{prince_edward_county_coast.id};
    """

    puts sql

    affected_rows = ActiveRecord::Base.connection.update(sql)

    puts "#{affected_rows} regions updated or created"
  end
end