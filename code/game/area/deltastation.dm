/*
### This file contains a list of all the areas in your station. Format is as follows:

/area/deltastation/CATEGORY/OR/DESCRIPTOR/NAME 	(you can make as many subdivisions as you want)
	name = "NICE NAME" 				(not required but makes things really nice)
	icon = 'ICON FILENAME' 			(defaults to 'icons/turf/areas.dmi')
	icon_state = "NAME OF ICON" 	(defaults to "unknown" (blank))
	requires_power = FALSE 				(defaults to true)
	soundscape_playlist = list()				(defaults to GENERIC from sound.dm. override it as "soundscape_playlist = list('sound/ambience/signal.ogg')" or using another define.

NOTE: there are two lists of areas in the end of this file: centcom and station itself. Please maintain these lists valid. --rastaf0
*/

/area/deltastation
	icon = 'icons/turf/area_deltastation.dmi'
	soundscape_playlist = SCAPE_STATION_GENERIC

//Maintenance

/area/deltastation/maintenance
	soundscape_playlist = SCAPE_STATION_MAINTENANCE

//Departments

/area/deltastation/maintenance/department/chapel
	name = "Chapel Maintenance"
	icon_state = "maint_chapel"

/area/deltastation/maintenance/department/chapel/monastery
	name = "Monastery Maintenance"
	icon_state = "maint_monastery"

/area/deltastation/maintenance/department/crew_quarters/bar
	name = "Bar Maintenance"
	icon_state = "maint_bar"

/area/deltastation/maintenance/department/crew_quarters/dorms
	name = "Dormitory Maintenance"
	icon_state = "maint_dorms"

/area/deltastation/maintenance/department/eva
	name = "EVA Maintenance"
	icon_state = "maint_eva"

/area/deltastation/maintenance/department/electrical
	name = "Electrical Maintenance"
	icon_state = "maint_electrical"

/area/deltastation/maintenance/department/engine/atmos
	name = "Atmospherics Maintenance"
	icon_state = "maint_atmos"

/area/deltastation/maintenance/department/security
	name = "Security Maintenance"
	icon_state = "maint_sec"

/area/deltastation/maintenance/department/security/brig
	name = "Brig Maintenance"
	icon_state = "maint_brig"

/area/deltastation/maintenance/department/medical
	name = "Medbay Maintenance"
	icon_state = "medbay_maint"

/area/deltastation/maintenance/department/medical/central
	name = "Central Medbay Maintenance"
	icon_state = "medbay_maint_central"

/area/deltastation/maintenance/department/medical/morgue
	name = "Morgue Maintenance"
	icon_state = "morgue_maint"

/area/deltastation/maintenance/department/science
	name = "Science Maintenance"
	icon_state = "maint_sci"

/area/deltastation/maintenance/department/science/central
	name = "Central Science Maintenance"
	icon_state = "maint_sci_central"

/area/deltastation/maintenance/department/cargo
	name = "Cargo Maintenance"
	icon_state = "maint_cargo"

/area/deltastation/maintenance/department/bridge
	name = "Bridge Maintenance"
	icon_state = "maint_bridge"

/area/deltastation/maintenance/department/engine
	name = "Engineering Maintenance"
	icon_state = "maint_engi"

/area/deltastation/maintenance/department/science/xenobiology
	name = "Xenobiology Maintenance"
	icon_state = "xenomaint"

//Maintenance - Generic

/area/deltastation/maintenance/aft
	name = "Aft Maintenance"
	icon_state = "amaint"

/area/deltastation/maintenance/aft/secondary
	name = "Aft Maintenance"
	icon_state = "amaint_2"

/area/deltastation/maintenance/central
	name = "Central Maintenance"
	icon_state = "maintcentral"

/area/deltastation/maintenance/central/secondary
	name = "Central Maintenance"
	icon_state = "maintcentral"

/area/deltastation/maintenance/fore
	name = "Fore Maintenance"
	icon_state = "fmaint"

/area/deltastation/maintenance/fore/secondary
	name = "Fore Maintenance"
	icon_state = "fmaint_2"

/area/deltastation/maintenance/starboard
	name = "Starboard Maintenance"
	icon_state = "smaint"

/area/deltastation/maintenance/starboard/central
	name = "Central Starboard Maintenance"
	icon_state = "smaint"

/area/deltastation/maintenance/starboard/secondary
	name = "Secondary Starboard Maintenance"
	icon_state = "smaint_2"

/area/deltastation/maintenance/starboard/aft
	name = "Starboard Quarter Maintenance"
	icon_state = "asmaint"

/area/deltastation/maintenance/starboard/aft/secondary
	name = "Secondary Starboard Quarter Maintenance"
	icon_state = "asmaint_2"

/area/deltastation/maintenance/starboard/fore
	name = "Starboard Bow Maintenance"
	icon_state = "fsmaint"

/area/deltastation/maintenance/port
	name = "Port Maintenance"
	icon_state = "pmaint"

/area/deltastation/maintenance/port/central
	name = "Central Port Maintenance"
	icon_state = "maintcentral"

/area/deltastation/maintenance/port/aft
	name = "Port Quarter Maintenance"
	icon_state = "apmaint"

/area/deltastation/maintenance/port/fore
	name = "Port Bow Maintenance"
	icon_state = "fpmaint"

/area/deltastation/maintenance/disposal
	name = "Waste Disposal"
	icon_state = "disposal"

/area/deltastation/maintenance/disposal/incinerator
	name = "Incinerator"
	icon_state = "disposal"

//Hallway

/area/deltastation/hallway/primary/aft
	name = "Aft Primary Hallway"
	icon_state = "hallA"

/area/deltastation/hallway/primary/fore
	name = "Fore Primary Hallway"
	icon_state = "hallF"

/area/deltastation/hallway/primary/starboard
	name = "Starboard Primary Hallway"
	icon_state = "hallS"

/area/deltastation/hallway/primary/port
	name = "Port Primary Hallway"
	icon_state = "hallP"

/area/deltastation/hallway/primary/central
	name = "Central Primary Hallway"
	icon_state = "hallC"

/area/deltastation/hallway/secondary/command
	name = "Command Hallway"
	icon_state = "bridge_hallway"

/area/deltastation/hallway/secondary/construction
	name = "Construction Area"
	icon_state = "construction"

/area/deltastation/hallway/secondary/exit
	name = "Escape Shuttle Hallway"
	icon_state = "escape"

/area/deltastation/hallway/secondary/exit/departure_lounge
	name = "Departure Lounge"
	icon_state = "escape_lounge"

/area/deltastation/hallway/secondary/entry
	name = "Arrival Shuttle Hallway"
	icon_state = "entry"

/area/deltastation/hallway/secondary/service
	name = "Service Hallway"
	icon_state = "hall_service"

//Command

/area/deltastation/bridge
	name = "Bridge"
	icon_state = "bridge"
	soundscape_playlist = list('sound/ambience/signal.ogg')

/area/deltastation/bridge/meeting_room
	name = "Heads of Staff Meeting Room"
	icon_state = "meeting"

/area/deltastation/bridge/meeting_room/council
	name = "Council Chamber"
	icon_state = "meeting"

/area/deltastation/bridge/showroom/corporate
	name = "Corporate Showroom"
	icon_state = "showroom"

/area/deltastation/crew_quarters/heads/captain
	name = "Captain's Office"
	icon_state = "captain"

/area/deltastation/crew_quarters/heads/captain/private
	name = "Captain's Quarters"
	icon_state = "captain"

/area/deltastation/crew_quarters/heads/chief
	name = "Chief Engineer's Office"
	icon_state = "ce_office"

/area/deltastation/crew_quarters/heads/cmo
	name = "Chief Medical Officer's Office"
	icon_state = "cmo_office"

/area/deltastation/crew_quarters/heads/hop
	name = "Head of Personnel's Office"
	icon_state = "hop_office"

/area/deltastation/crew_quarters/heads/hos
	name = "Head of Security's Office"
	icon_state = "hos_office"

/area/deltastation/crew_quarters/heads/hor
	name = "Research Director's Office"
	icon_state = "rd_office"

/area/deltastation/comms
	name = "Communications Relay"
	icon_state = "tcomsatcham"

/area/deltastation/server
	name = "Messaging Server Room"
	icon_state = "server"

//Crew

/area/deltastation/crew_quarters/dorms
	name = "Dormitories"
	icon_state = "Sleep"

/area/deltastation/crew_quarters/toilet
	name = "Dormitory Toilets"
	icon_state = "toilet"

/area/deltastation/crew_quarters/toilet/auxiliary
	name = "Auxiliary Restrooms"
	icon_state = "toilet"

/area/deltastation/crew_quarters/toilet/locker
	name = "Locker Toilets"
	icon_state = "toilet"

/area/deltastation/crew_quarters/toilet/restrooms
	name = "Restrooms"
	icon_state = "toilet"

/area/deltastation/crew_quarters/locker
	name = "Locker Room"
	icon_state = "locker"

/area/deltastation/crew_quarters/lounge
	name = "Lounge"
	icon_state = "yellow"

/area/deltastation/crew_quarters/fitness
	name = "Fitness Room"
	icon_state = "fitness"

/area/deltastation/crew_quarters/fitness/locker_room
	name = "Unisex Locker Room"
	icon_state = "fitness"

/area/deltastation/crew_quarters/fitness/recreation
	name = "Recreation Area"
	icon_state = "fitness"

/area/deltastation/crew_quarters/cafeteria
	name = "Cafeteria"
	icon_state = "cafeteria"

/area/deltastation/crew_quarters/kitchen
	name = "Kitchen"
	icon_state = "kitchen"

/area/deltastation/crew_quarters/kitchen/coldroom
	name = "Kitchen Cold Room"
	icon_state = "kitchen_cold"

/area/deltastation/crew_quarters/bar
	name = "Bar"
	icon_state = "bar"

/area/deltastation/crew_quarters/bar/atrium
	name = "Atrium"
	icon_state = "bar"

/area/deltastation/crew_quarters/electronic_marketing_den
	name = "Electronic Marketing Den"
	icon_state = "bar"

/area/deltastation/crew_quarters/abandoned_gambling_den
	name = "Abandoned Gambling Den"
	icon_state = "abandoned_g_den"

/area/deltastation/crew_quarters/abandoned_gambling_den/secondary
	icon_state = "abandoned_g_den_2"

/area/deltastation/crew_quarters/theatre
	name = "Theatre"
	icon_state = "Theatre"

/area/deltastation/crew_quarters/theatre/abandoned
	name = "Abandoned Theatre"
	icon_state = "Theatre"

/area/deltastation/library
	name = "Library"
	icon_state = "library"

/area/deltastation/library/lounge
	name = "Library Lounge"
	icon_state = "library"

/area/deltastation/library/abandoned
	name = "Abandoned Library"
	icon_state = "library"

/area/deltastation/chapel
	icon_state = "chapel"
	soundscape_playlist = SCAPE_STATION_HOLY

/area/deltastation/chapel/main
	name = "Chapel"

/area/deltastation/chapel/main/monastery
	name = "Monastery"

/area/deltastation/chapel/office
	name = "Chapel Office"
	icon_state = "chapeloffice"

/area/deltastation/chapel/asteroid
	name = "Chapel Asteroid"
	icon_state = "explored"

/area/deltastation/chapel/asteroid/monastery
	name = "Monastery Asteroid"

/area/deltastation/chapel/dock
	name = "Chapel Dock"
	icon_state = "construction"

/area/deltastation/lawoffice
	name = "Law Office"
	icon_state = "law"


//Engineering

/area/deltastation/engine
	soundscape_playlist = SCAPE_STATION_ENGINEERING

/area/deltastation/engine/engine_smes
	name = "Engineering SMES"
	icon_state = "engine_smes"

/area/deltastation/engine/engineering
	name = "Engineering"
	icon_state = "engine"

/area/deltastation/engine/atmos
	name = "Atmospherics"
	icon_state = "atmos"

/area/deltastation/engine/atmospherics_engine
	name = "Atmospherics Engine"
	icon_state = "atmos_engine"

/area/deltastation/engine/engine_room //donut station specific
	name = "Engine Room"
	icon_state = "atmos_engine"

/area/deltastation/engine/engine_room/external
	name = "Supermatter External Access"
	icon_state = "engine_foyer"

/area/deltastation/engine/supermatter
	name = "Supermatter Engine"
	icon_state = "engine_sm"

/area/deltastation/engine/break_room
	name = "Engineering Foyer"
	icon_state = "engine_foyer"

/area/deltastation/engine/gravity_generator
	name = "Gravity Generator Room"
	icon_state = "grav_gen"

/area/deltastation/engine/storage
	name = "Engineering Storage"
	icon_state = "engi_storage"

/area/deltastation/engine/storage_shared
	name = "Shared Engineering Storage"
	icon_state = "engi_storage"

/area/deltastation/engine/transit_tube
	name = "Transit Tube"
	icon_state = "transit_tube"


//Solars

/area/deltastation/solar
	requires_power = 0
	soundscape_playlist = SCAPE_STATION_ENGINEERING

/area/deltastation/solar/fore
	name = "Fore Solar Array"
	icon_state = "yellow"

/area/deltastation/solar/aft
	name = "Aft Solar Array"
	icon_state = "yellow"

/area/deltastation/solar/aux/port
	name = "Port Bow Auxiliary Solar Array"
	icon_state = "panelsA"

/area/deltastation/solar/aux/starboard
	name = "Starboard Bow Auxiliary Solar Array"
	icon_state = "panelsA"

/area/deltastation/solar/starboard
	name = "Starboard Solar Array"
	icon_state = "panelsS"

/area/deltastation/solar/starboard/aft
	name = "Starboard Quarter Solar Array"
	icon_state = "panelsAS"

/area/deltastation/solar/starboard/fore
	name = "Starboard Bow Solar Array"
	icon_state = "panelsFS"

/area/deltastation/solar/port
	name = "Port Solar Array"
	icon_state = "panelsP"

/area/deltastation/solar/port/aft
	name = "Port Quarter Solar Array"
	icon_state = "panelsAP"

/area/deltastation/solar/port/fore
	name = "Port Bow Solar Array"
	icon_state = "panelsFP"


//Solar Maint

/area/deltastation/maintenance/solars
	name = "Solar Maintenance"
	icon_state = "yellow"

/area/deltastation/maintenance/solars/port
	name = "Port Solar Maintenance"
	icon_state = "SolarcontrolP"

/area/deltastation/maintenance/solars/port/aft
	name = "Port Quarter Solar Maintenance"
	icon_state = "SolarcontrolAP"

/area/deltastation/maintenance/solars/port/fore
	name = "Port Bow Solar Maintenance"
	icon_state = "SolarcontrolFP"

/area/deltastation/maintenance/solars/starboard
	name = "Starboard Solar Maintenance"
	icon_state = "SolarcontrolS"

/area/deltastation/maintenance/solars/starboard/aft
	name = "Starboard Quarter Solar Maintenance"
	icon_state = "SolarcontrolAS"

/area/deltastation/maintenance/solars/starboard/fore
	name = "Starboard Bow Solar Maintenance"
	icon_state = "SolarcontrolFS"

//Teleporter

/area/deltastation/teleporter
	name = "Teleporter Room"
	icon_state = "teleporter"
	soundscape_playlist = SCAPE_STATION_ENGINEERING

/area/deltastation/gateway
	name = "Gateway"
	icon_state = "gateway"
	soundscape_playlist = SCAPE_STATION_ENGINEERING

//MedBay

/area/deltastation/medical
	name = "Medical"
	icon_state = "medbay3"
	soundscape_playlist = SCAPE_STATION_MEDICAL

/area/deltastation/medical/abandoned
	name = "Abandoned Medbay"
	icon_state = "medbay3"
	soundscape_playlist = list('sound/ambience/signal.ogg')

/area/deltastation/medical/medbay/central
	name = "Medbay Central"
	icon_state = "medbay"

/area/deltastation/medical/medbay/lobby
	name = "Medbay Lobby"
	icon_state = "medbay"

	//Medbay is a large area, these additional areas help level out APC load.

/area/deltastation/medical/medbay/zone2
	name = "Medbay"
	icon_state = "medbay2"

/area/deltastation/medical/medbay/aft
	name = "Medbay Aft"
	icon_state = "medbay3"

/area/deltastation/medical/storage
	name = "Medbay Storage"
	icon_state = "medbay2"

/area/deltastation/medical/patients_rooms
	name = "Patients' Rooms"
	icon_state = "patients"

/area/deltastation/medical/patients_rooms/room_a
	name = "Patient Room A"
	icon_state = "patients"

/area/deltastation/medical/patients_rooms/room_b
	name = "Patient Room B"
	icon_state = "patients"

/area/deltastation/medical/virology
	name = "Virology"
	icon_state = "virology"

/area/deltastation/medical/morgue
	name = "Morgue"
	icon_state = "morgue"
	soundscape_playlist = SCAPE_STATION_SPOOKY

/area/deltastation/medical/chemistry
	name = "Chemistry"
	icon_state = "chem"

/area/deltastation/medical/surgery
	name = "Surgery"
	icon_state = "surgery"

/area/deltastation/medical/cryo
	name = "Cryogenics"
	icon_state = "cryo"

/area/deltastation/medical/exam_room
	name = "Exam Room"
	icon_state = "exam_room"

/area/deltastation/medical/genetics
	name = "Genetics Lab"
	icon_state = "genetics"

/area/deltastation/medical/genetics/cloning
	name = "Cloning Lab"
	icon_state = "cloning"

/area/deltastation/medical/sleeper
	name = "Medbay Treatment Center"
	icon_state = "exam_room"


//Security

/area/deltastation/security
	name = "Security"
	icon_state = "security"
	soundscape_playlist = SCAPE_STATION_HIGHSEC

/area/deltastation/security/main
	name = "Security Office"
	icon_state = "security"

/area/deltastation/security/brig
	name = "Brig"
	icon_state = "brig"

/area/deltastation/security/courtroom
	name = "Courtroom"
	icon_state = "courtroom"

/area/deltastation/security/prison
	name = "Prison Wing"
	icon_state = "sec_prison"

/area/deltastation/security/processing
	name = "Labor Shuttle Dock"
	icon_state = "sec_prison"

/area/deltastation/security/processing/cremation
	name = "Security Crematorium"
	icon_state = "sec_prison"

/area/deltastation/security/warden
	name = "Brig Control"
	icon_state = "Warden"

/area/deltastation/security/detectives_office
	name = "Detective's Office"
	icon_state = "detective"
	soundscape_playlist = list('sound/ambience/ambidet1.ogg','sound/ambience/ambidet2.ogg')

/area/deltastation/security/detectives_office/private_investigators_office
	name = "Private Investigator's Office"
	icon_state = "detective"

/area/deltastation/security/range
	name = "Firing Range"
	icon_state = "firingrange"

/area/deltastation/security/execution
	icon_state = "execution_room"

/area/deltastation/security/execution/transfer
	name = "Transfer Centre"

/area/deltastation/security/execution/education
	name = "Prisoner Education Chamber"

/area/deltastation/security/nuke_storage
	name = "Vault"
	icon_state = "nuke_storage"

/area/deltastation/ai_monitored/nuke_storage
	name = "Vault"
	icon_state = "nuke_storage"

/area/deltastation/security/checkpoint
	name = "Security Checkpoint"
	icon_state = "checkpoint1"

/area/deltastation/security/checkpoint/auxiliary
	icon_state = "checkpoint_aux"

/area/deltastation/security/checkpoint/escape
	icon_state = "checkpoint_esc"

/area/deltastation/security/checkpoint/supply
	name = "Security Post - Cargo Bay"
	icon_state = "checkpoint_supp"

/area/deltastation/security/checkpoint/engineering
	name = "Security Post - Engineering"
	icon_state = "checkpoint_engi"

/area/deltastation/security/checkpoint/medical
	name = "Security Post - Medbay"
	icon_state = "checkpoint_med"

/area/deltastation/security/checkpoint/science
	name = "Security Post - Science"
	icon_state = "checkpoint_sci"

/area/deltastation/security/checkpoint/science/research
	name = "Security Post - Research Division"
	icon_state = "checkpoint_res"

/area/deltastation/security/checkpoint/customs
	name = "Customs"
	icon_state = "customs_point"

/area/deltastation/security/checkpoint/customs/auxiliary
	icon_state = "customs_point_aux"


//Service

/area/deltastation/quartermaster
	name = "Quartermasters"
	icon_state = "quart"

/area/deltastation/quartermaster/sorting
	name = "Delivery Office"
	icon_state = "cargo_delivery"

/area/deltastation/quartermaster/warehouse
	name = "Warehouse"
	icon_state = "cargo_warehouse"

/area/deltastation/quartermaster/office
	name = "Cargo Office"
	icon_state = "quartoffice"

/area/deltastation/quartermaster/storage
	name = "Cargo Bay"
	icon_state = "cargo_bay"

/area/deltastation/quartermaster/qm
	name = "Quartermaster's Office"
	icon_state = "quart"

/area/deltastation/quartermaster/miningdock
	name = "Mining Dock"
	icon_state = "mining"

/area/deltastation/quartermaster/miningoffice
	name = "Mining Office"
	icon_state = "mining"

/area/deltastation/janitor
	name = "Custodial Closet"
	icon_state = "janitor"

/area/deltastation/hydroponics
	name = "Hydroponics"
	icon_state = "hydro"

/area/deltastation/hydroponics/garden
	name = "Garden"
	icon_state = "garden"

/area/deltastation/hydroponics/garden/abandoned
	name = "Abandoned Garden"
	icon_state = "abandoned_garden"

/area/deltastation/hydroponics/garden/monastery
	name = "Monastery Garden"
	icon_state = "hydro"


//Science

/area/deltastation/science
	name = "Science Division"
	icon_state = "toxlab"

/area/deltastation/science/lab
	name = "Research and Development"
	icon_state = "toxlab"

/area/deltastation/science/xenobiology
	name = "Xenobiology Lab"
	icon_state = "toxlab"

/area/deltastation/science/storage
	name = "Toxins Storage"
	icon_state = "toxstorage"

/area/deltastation/science/test_area
	name = "Toxins Test Area"
	icon_state = "toxtest"

/area/deltastation/science/mixing
	name = "Toxins Mixing Lab"
	icon_state = "toxmix"

/area/deltastation/science/mixing/chamber
	name = "Toxins Mixing Chamber"
	icon_state = "toxmix"

/area/deltastation/science/misc_lab
	name = "Testing Lab"
	icon_state = "toxmisc"

/area/deltastation/science/misc_lab/range
	name = "Research Testing Range"
	icon_state = "toxmisc"

/area/deltastation/science/server
	name = "Research Division Server Room"
	icon_state = "server"

/area/deltastation/science/explab
	name = "Experimentation Lab"
	icon_state = "toxmisc"

/area/deltastation/science/robotics
	name = "Robotics"
	icon_state = "medresearch"

/area/deltastation/science/robotics/mechbay
	name = "Mech Bay"
	icon_state = "mechbay"

/area/deltastation/science/robotics/lab
	name = "Robotics Lab"
	icon_state = "ass_line"

/area/deltastation/science/research
	name = "Research Division"
	icon_state = "medresearch"

/area/deltastation/science/research/abandoned
	name = "Abandoned Research Lab"
	icon_state = "medresearch"

/area/deltastation/science/nanite
	name = "Nanite Lab"
	icon_state = "toxmisc"

//Storage

/area/deltastation/storage/tools
	name = "Auxiliary Tool Storage"
	icon_state = "storage"

/area/deltastation/storage/primary
	name = "Primary Tool Storage"
	icon_state = "primarystorage"

/area/deltastation/storage/art
	name = "Art Supply Storage"
	icon_state = "storage"

/area/deltastation/storage/tcom
	name = "Telecomms Storage"
	icon_state = "green"

/area/deltastation/storage/eva
	name = "EVA Storage"
	icon_state = "eva"

/area/deltastation/storage/emergency/starboard
	name = "Starboard Emergency Storage"
	icon_state = "emergencystorage"

/area/deltastation/storage/emergency/port
	name = "Port Emergency Storage"
	icon_state = "emergencystorage"

/area/deltastation/storage/tech
	name = "Technical Storage"
	icon_state = "auxstorage"

//Construction

/area/deltastation/construction
	name = "Construction Area"
	icon_state = "yellow"
	soundscape_playlist = SCAPE_STATION_ENGINEERING

/area/deltastation/construction/mining/aux_base
	name = "Auxiliary Base Construction"
	icon_state = "aux_base_construction"

/area/deltastation/construction/storage_wing
	name = "Storage Wing"
	icon_state = "storage_wing"

// Vacant Rooms
/area/deltastation/vacant_room
	name = "Vacant Room"
	soundscape_playlist = SCAPE_STATION_MAINTENANCE
	icon_state = "vacant_room"

/area/deltastation/vacant_room/office
	name = "Vacant Office"
	icon_state = "vacant_office"

/area/deltastation/vacant_room/commissary
	name = "Vacant Commissary"
	icon_state = "vacant_commissary"

//AI

/area/deltastation/ai_monitored/security/armory
	name = "Armory"
	icon_state = "armory"
	soundscape_playlist = SCAPE_STATION_HIGHSEC

/area/deltastation/ai_monitored/storage/eva
	name = "EVA Storage"
	icon_state = "eva"
	soundscape_playlist = SCAPE_STATION_HIGHSEC

/area/deltastation/ai_monitored/storage/satellite
	name = "AI Satellite Maint"
	icon_state = "storage"
	soundscape_playlist = SCAPE_STATION_HIGHSEC

	//Turret_protected

/area/deltastation/ai_monitored/turret_protected
	soundscape_playlist = list('sound/ambience/ambimalf.ogg', 'sound/ambience/ambitech.ogg', 'sound/ambience/ambitech2.ogg', 'sound/ambience/ambiatmos.ogg', 'sound/ambience/ambiatmos2.ogg')

/area/deltastation/ai_monitored/turret_protected/ai_upload
	name = "AI Upload Chamber"
	icon_state = "ai_upload"

/area/deltastation/ai_monitored/turret_protected/ai_upload_foyer
	name = "AI Upload Access"
	icon_state = "ai_foyer"

/area/deltastation/ai_monitored/turret_protected/ai
	name = "AI Chamber"
	icon_state = "ai_chamber"

/area/deltastation/ai_monitored/turret_protected/aisat
	name = "AI Satellite"
	icon_state = "ai"

/area/deltastation/ai_monitored/turret_protected/aisat/atmos
	name = "AI Satellite Atmos"
	icon_state = "ai"

/area/deltastation/ai_monitored/turret_protected/aisat/foyer
	name = "AI Satellite Foyer"
	icon_state = "ai"

/area/deltastation/ai_monitored/turret_protected/aisat/service
	name = "AI Satellite Service"
	icon_state = "ai"

/area/deltastation/ai_monitored/turret_protected/aisat/hallway
	name = "AI Satellite Hallway"
	icon_state = "ai"

/area/deltastation/aisat
	name = "AI Satellite Exterior"
	icon_state = "yellow"

/area/deltastation/ai_monitored/turret_protected/aisat_interior
	name = "AI Satellite Antechamber"
	icon_state = "ai"

/area/deltastation/ai_monitored/turret_protected/AIsatextAS
	name = "AI Sat Ext"
	icon_state = "storage"

/area/deltastation/ai_monitored/turret_protected/AIsatextAP
	name = "AI Sat Ext"
	icon_state = "storage"


// Telecommunications Satellite

/area/deltastation/tcommsat
	soundscape_playlist = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg', 'sound/ambience/ambitech.ogg',\
											'sound/ambience/ambitech2.ogg', 'sound/ambience/ambitech3.ogg')

/area/deltastation/tcommsat/computer
	name = "Telecomms Control Room"
	icon_state = "tcomsatcomp"

/area/deltastation/tcommsat/server
	name = "Telecomms Server Room"
	icon_state = "tcomsatcham"
