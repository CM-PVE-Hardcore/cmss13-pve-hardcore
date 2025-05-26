/*
### This file contains a list of all the areas in your station. Format is as follows:

/area/station/CATEGORY/OR/DESCRIPTOR/NAME 	(you can make as many subdivisions as you want)
	name = "NICE NAME" 				(not required but makes things really nice)
	icon = 'ICON FILENAME' 			(defaults to 'icons/turf/areas.dmi')
	icon_state = "NAME OF ICON" 	(defaults to "unknown" (blank))
	requires_power = FALSE 				(defaults to true)
	soundscape_playlist = list()				(defaults to GENERIC from sound.dm. override it as "soundscape_playlist = list('sound/ambience/signal.ogg')" or using another define.

NOTE: there are two lists of areas in the end of this file: centcom and station itself. Please maintain these lists valid. --rastaf0
*/

/area/station
	icon = 'icons/turf/area_station.dmi'
	soundscape_playlist = SCAPE_STATION_GENERIC

//Maintenance

/area/station/maintenance
	soundscape_playlist = SCAPE_STATION_MAINTENANCE

//Departments

/area/station/maintenance/department/chapel
	name = "Chapel Maintenance"
	icon_state = "maint_chapel"

/area/station/maintenance/department/chapel/monastery
	name = "Monastery Maintenance"
	icon_state = "maint_monastery"

/area/station/maintenance/department/crew_quarters/bar
	name = "Bar Maintenance"
	icon_state = "maint_bar"

/area/station/maintenance/department/crew_quarters/dorms
	name = "Dormitory Maintenance"
	icon_state = "maint_dorms"

/area/station/maintenance/department/eva
	name = "EVA Maintenance"
	icon_state = "maint_eva"

/area/station/maintenance/department/electrical
	name = "Electrical Maintenance"
	icon_state = "maint_electrical"

/area/station/maintenance/department/engine/atmos
	name = "Atmospherics Maintenance"
	icon_state = "maint_atmos"

/area/station/maintenance/department/security
	name = "Security Maintenance"
	icon_state = "maint_sec"

/area/station/maintenance/department/security/brig
	name = "Brig Maintenance"
	icon_state = "maint_brig"

/area/station/maintenance/department/medical
	name = "Medbay Maintenance"
	icon_state = "medbay_maint"

/area/station/maintenance/department/medical/central
	name = "Central Medbay Maintenance"
	icon_state = "medbay_maint_central"

/area/station/maintenance/department/medical/morgue
	name = "Morgue Maintenance"
	icon_state = "morgue_maint"

/area/station/maintenance/department/science
	name = "Science Maintenance"
	icon_state = "maint_sci"

/area/station/maintenance/department/science/central
	name = "Central Science Maintenance"
	icon_state = "maint_sci_central"

/area/station/maintenance/department/cargo
	name = "Cargo Maintenance"
	icon_state = "maint_cargo"

/area/station/maintenance/department/bridge
	name = "Bridge Maintenance"
	icon_state = "maint_bridge"

/area/station/maintenance/department/engine
	name = "Engineering Maintenance"
	icon_state = "maint_engi"

/area/station/maintenance/department/science/xenobiology
	name = "Xenobiology Maintenance"
	icon_state = "xenomaint"

//Maintenance - Generic

/area/station/maintenance/aft
	name = "Aft Maintenance"
	icon_state = "amaint"

/area/station/maintenance/aft/secondary
	name = "Aft Maintenance"
	icon_state = "amaint_2"

/area/station/maintenance/central
	name = "Central Maintenance"
	icon_state = "maintcentral"

/area/station/maintenance/central/secondary
	name = "Central Maintenance"
	icon_state = "maintcentral"

/area/station/maintenance/fore
	name = "Fore Maintenance"
	icon_state = "fmaint"

/area/station/maintenance/fore/secondary
	name = "Fore Maintenance"
	icon_state = "fmaint_2"

/area/station/maintenance/starboard
	name = "Starboard Maintenance"
	icon_state = "smaint"

/area/station/maintenance/starboard/central
	name = "Central Starboard Maintenance"
	icon_state = "smaint"

/area/station/maintenance/starboard/secondary
	name = "Secondary Starboard Maintenance"
	icon_state = "smaint_2"

/area/station/maintenance/starboard/aft
	name = "Starboard Quarter Maintenance"
	icon_state = "asmaint"

/area/station/maintenance/starboard/aft/secondary
	name = "Secondary Starboard Quarter Maintenance"
	icon_state = "asmaint_2"

/area/station/maintenance/starboard/fore
	name = "Starboard Bow Maintenance"
	icon_state = "fsmaint"

/area/station/maintenance/port
	name = "Port Maintenance"
	icon_state = "pmaint"

/area/station/maintenance/port/central
	name = "Central Port Maintenance"
	icon_state = "maintcentral"

/area/station/maintenance/port/aft
	name = "Port Quarter Maintenance"
	icon_state = "apmaint"

/area/station/maintenance/port/fore
	name = "Port Bow Maintenance"
	icon_state = "fpmaint"

/area/station/maintenance/disposal
	name = "Waste Disposal"
	icon_state = "disposal"

/area/station/maintenance/disposal/incinerator
	name = "Incinerator"
	icon_state = "disposal"

//Hallway

/area/station/hallway/primary/aft
	name = "Aft Primary Hallway"
	icon_state = "hallA"

/area/station/hallway/primary/fore
	name = "Fore Primary Hallway"
	icon_state = "hallF"

/area/station/hallway/primary/starboard
	name = "Starboard Primary Hallway"
	icon_state = "hallS"

/area/station/hallway/primary/port
	name = "Port Primary Hallway"
	icon_state = "hallP"

/area/station/hallway/primary/central
	name = "Central Primary Hallway"
	icon_state = "hallC"

/area/station/hallway/secondary/command
	name = "Command Hallway"
	icon_state = "bridge_hallway"

/area/station/hallway/secondary/construction
	name = "Construction Area"
	icon_state = "construction"

/area/station/hallway/secondary/exit
	name = "Escape Shuttle Hallway"
	icon_state = "escape"

/area/station/hallway/secondary/exit/departure_lounge
	name = "Departure Lounge"
	icon_state = "escape_lounge"

/area/station/hallway/secondary/entry
	name = "Arrival Shuttle Hallway"
	icon_state = "entry"

/area/station/hallway/secondary/service
	name = "Service Hallway"
	icon_state = "hall_service"

//Command

/area/station/bridge
	name = "Bridge"
	icon_state = "bridge"
	soundscape_playlist = list('sound/ambience/signal.ogg')

/area/station/bridge/meeting_room
	name = "Heads of Staff Meeting Room"
	icon_state = "meeting"

/area/station/bridge/meeting_room/council
	name = "Council Chamber"
	icon_state = "meeting"

/area/station/bridge/showroom/corporate
	name = "Corporate Showroom"
	icon_state = "showroom"

/area/station/crew_quarters/heads/captain
	name = "Captain's Office"
	icon_state = "captain"

/area/station/crew_quarters/heads/captain/private
	name = "Captain's Quarters"
	icon_state = "captain"

/area/station/crew_quarters/heads/chief
	name = "Chief Engineer's Office"
	icon_state = "ce_office"

/area/station/crew_quarters/heads/cmo
	name = "Chief Medical Officer's Office"
	icon_state = "cmo_office"

/area/station/crew_quarters/heads/hop
	name = "Head of Personnel's Office"
	icon_state = "hop_office"

/area/station/crew_quarters/heads/hos
	name = "Head of Security's Office"
	icon_state = "hos_office"

/area/station/crew_quarters/heads/hor
	name = "Research Director's Office"
	icon_state = "rd_office"

/area/station/comms
	name = "Communications Relay"
	icon_state = "tcomsatcham"

/area/station/server
	name = "Messaging Server Room"
	icon_state = "server"

//Crew

/area/station/crew_quarters/dorms
	name = "Dormitories"
	icon_state = "Sleep"

/area/station/crew_quarters/toilet
	name = "Dormitory Toilets"
	icon_state = "toilet"

/area/station/crew_quarters/toilet/auxiliary
	name = "Auxiliary Restrooms"
	icon_state = "toilet"

/area/station/crew_quarters/toilet/locker
	name = "Locker Toilets"
	icon_state = "toilet"

/area/station/crew_quarters/toilet/restrooms
	name = "Restrooms"
	icon_state = "toilet"

/area/station/crew_quarters/locker
	name = "Locker Room"
	icon_state = "locker"

/area/station/crew_quarters/lounge
	name = "Lounge"
	icon_state = "yellow"

/area/station/crew_quarters/fitness
	name = "Fitness Room"
	icon_state = "fitness"

/area/station/crew_quarters/fitness/locker_room
	name = "Unisex Locker Room"
	icon_state = "fitness"

/area/station/crew_quarters/fitness/recreation
	name = "Recreation Area"
	icon_state = "fitness"

/area/station/holodeck
	name = "Holodeck"
	icon_state = "fitness"

/area/station/holodeck/rec_center
	name = "Holodeck Recreation Center"
	icon_state = "fitness"

/area/station/crew_quarters/cafeteria
	name = "Cafeteria"
	icon_state = "cafeteria"

/area/station/crew_quarters/kitchen
	name = "Kitchen"
	icon_state = "kitchen"

/area/station/crew_quarters/kitchen/coldroom
	name = "Kitchen Cold Room"
	icon_state = "kitchen_cold"

/area/station/crew_quarters/bar
	name = "Bar"
	icon_state = "bar"

/area/station/crew_quarters/bar/atrium
	name = "Atrium"
	icon_state = "bar"

/area/station/crew_quarters/electronic_marketing_den
	name = "Electronic Marketing Den"
	icon_state = "bar"

/area/station/crew_quarters/abandoned_gambling_den
	name = "Abandoned Gambling Den"
	icon_state = "abandoned_g_den"

/area/station/crew_quarters/abandoned_gambling_den/secondary
	icon_state = "abandoned_g_den_2"

/area/station/crew_quarters/theatre
	name = "Theatre"
	icon_state = "Theatre"

/area/station/crew_quarters/theatre/abandoned
	name = "Abandoned Theatre"
	icon_state = "Theatre"

/area/station/library
	name = "Library"
	icon_state = "library"

/area/station/library/lounge
	name = "Library Lounge"
	icon_state = "library"

/area/station/library/abandoned
	name = "Abandoned Library"
	icon_state = "library"

/area/station/chapel
	icon_state = "chapel"
	soundscape_playlist = SCAPE_STATION_HOLY

/area/station/chapel/main
	name = "Chapel"

/area/station/chapel/main/monastery
	name = "Monastery"

/area/station/chapel/office
	name = "Chapel Office"
	icon_state = "chapeloffice"

/area/station/chapel/asteroid
	name = "Chapel Asteroid"
	icon_state = "explored"

/area/station/chapel/asteroid/monastery
	name = "Monastery Asteroid"

/area/station/chapel/dock
	name = "Chapel Dock"
	icon_state = "construction"

/area/station/lawoffice
	name = "Law Office"
	icon_state = "law"


//Engineering

/area/station/engine
	soundscape_playlist = SCAPE_STATION_ENGINEERING

/area/station/engine/engine_smes
	name = "Engineering SMES"
	icon_state = "engine_smes"

/area/station/engine/engineering
	name = "Engineering"
	icon_state = "engine"

/area/station/engine/atmos
	name = "Atmospherics"
	icon_state = "atmos"

/area/station/engine/atmospherics_engine
	name = "Atmospherics Engine"
	icon_state = "atmos_engine"

/area/station/engine/engine_room //donut station specific
	name = "Engine Room"
	icon_state = "atmos_engine"

/area/station/engine/engine_room/external
	name = "Supermatter External Access"
	icon_state = "engine_foyer"

/area/station/engine/supermatter
	name = "Supermatter Engine"
	icon_state = "engine_sm"

/area/station/engine/break_room
	name = "Engineering Foyer"
	icon_state = "engine_foyer"

/area/station/engine/gravity_generator
	name = "Gravity Generator Room"
	icon_state = "grav_gen"

/area/station/engine/storage
	name = "Engineering Storage"
	icon_state = "engi_storage"

/area/station/engine/storage_shared
	name = "Shared Engineering Storage"
	icon_state = "engi_storage"

/area/station/engine/transit_tube
	name = "Transit Tube"
	icon_state = "transit_tube"


//Solars

/area/station/solar
	requires_power = 0
	soundscape_playlist = SCAPE_STATION_ENGINEERING

/area/station/solar/fore
	name = "Fore Solar Array"
	icon_state = "yellow"

/area/station/solar/aft
	name = "Aft Solar Array"
	icon_state = "yellow"

/area/station/solar/aux/port
	name = "Port Bow Auxiliary Solar Array"
	icon_state = "panelsA"

/area/station/solar/aux/starboard
	name = "Starboard Bow Auxiliary Solar Array"
	icon_state = "panelsA"

/area/station/solar/starboard
	name = "Starboard Solar Array"
	icon_state = "panelsS"

/area/station/solar/starboard/aft
	name = "Starboard Quarter Solar Array"
	icon_state = "panelsAS"

/area/station/solar/starboard/fore
	name = "Starboard Bow Solar Array"
	icon_state = "panelsFS"

/area/station/solar/port
	name = "Port Solar Array"
	icon_state = "panelsP"

/area/station/solar/port/aft
	name = "Port Quarter Solar Array"
	icon_state = "panelsAP"

/area/station/solar/port/fore
	name = "Port Bow Solar Array"
	icon_state = "panelsFP"


//Solar Maint

/area/station/maintenance/solars
	name = "Solar Maintenance"
	icon_state = "yellow"

/area/station/maintenance/solars/port
	name = "Port Solar Maintenance"
	icon_state = "SolarcontrolP"

/area/station/maintenance/solars/port/aft
	name = "Port Quarter Solar Maintenance"
	icon_state = "SolarcontrolAP"

/area/station/maintenance/solars/port/fore
	name = "Port Bow Solar Maintenance"
	icon_state = "SolarcontrolFP"

/area/station/maintenance/solars/starboard
	name = "Starboard Solar Maintenance"
	icon_state = "SolarcontrolS"

/area/station/maintenance/solars/starboard/aft
	name = "Starboard Quarter Solar Maintenance"
	icon_state = "SolarcontrolAS"

/area/station/maintenance/solars/starboard/fore
	name = "Starboard Bow Solar Maintenance"
	icon_state = "SolarcontrolFS"

//Teleporter

/area/station/teleporter
	name = "Teleporter Room"
	icon_state = "teleporter"
	soundscape_playlist = SCAPE_STATION_ENGINEERING

/area/station/gateway
	name = "Gateway"
	icon_state = "gateway"
	soundscape_playlist = SCAPE_STATION_ENGINEERING

//MedBay

/area/station/medical
	name = "Medical"
	icon_state = "medbay3"
	soundscape_playlist = SCAPE_STATION_MEDICAL

/area/station/medical/abandoned
	name = "Abandoned Medbay"
	icon_state = "medbay3"
	soundscape_playlist = list('sound/ambience/signal.ogg')

/area/station/medical/medbay/central
	name = "Medbay Central"
	icon_state = "medbay"

/area/station/medical/medbay/lobby
	name = "Medbay Lobby"
	icon_state = "medbay"

	//Medbay is a large area, these additional areas help level out APC load.

/area/station/medical/medbay/zone2
	name = "Medbay"
	icon_state = "medbay2"

/area/station/medical/medbay/aft
	name = "Medbay Aft"
	icon_state = "medbay3"

/area/station/medical/storage
	name = "Medbay Storage"
	icon_state = "medbay2"

/area/station/medical/patients_rooms
	name = "Patients' Rooms"
	icon_state = "patients"

/area/station/medical/patients_rooms/room_a
	name = "Patient Room A"
	icon_state = "patients"

/area/station/medical/patients_rooms/room_b
	name = "Patient Room B"
	icon_state = "patients"

/area/station/medical/virology
	name = "Virology"
	icon_state = "virology"

/area/station/medical/morgue
	name = "Morgue"
	icon_state = "morgue"
	soundscape_playlist = SCAPE_STATION_SPOOKY

/area/station/medical/chemistry
	name = "Chemistry"
	icon_state = "chem"

/area/station/medical/surgery
	name = "Surgery"
	icon_state = "surgery"

/area/station/medical/cryo
	name = "Cryogenics"
	icon_state = "cryo"

/area/station/medical/exam_room
	name = "Exam Room"
	icon_state = "exam_room"

/area/station/medical/genetics
	name = "Genetics Lab"
	icon_state = "genetics"

/area/station/medical/genetics/cloning
	name = "Cloning Lab"
	icon_state = "cloning"

/area/station/medical/sleeper
	name = "Medbay Treatment Center"
	icon_state = "exam_room"


//Security

/area/station/security
	name = "Security"
	icon_state = "security"
	soundscape_playlist = SCAPE_STATION_HIGHSEC

/area/station/security/main
	name = "Security Office"
	icon_state = "security"

/area/station/security/brig
	name = "Brig"
	icon_state = "brig"

/area/station/security/courtroom
	name = "Courtroom"
	icon_state = "courtroom"

/area/station/security/prison
	name = "Prison Wing"
	icon_state = "sec_prison"

/area/station/security/processing
	name = "Labor Shuttle Dock"
	icon_state = "sec_prison"

/area/station/security/processing/cremation
	name = "Security Crematorium"
	icon_state = "sec_prison"

/area/station/security/warden
	name = "Brig Control"
	icon_state = "Warden"

/area/station/security/detectives_office
	name = "Detective's Office"
	icon_state = "detective"
	soundscape_playlist = list('sound/ambience/ambidet1.ogg','sound/ambience/ambidet2.ogg')

/area/station/security/detectives_office/private_investigators_office
	name = "Private Investigator's Office"
	icon_state = "detective"

/area/station/security/range
	name = "Firing Range"
	icon_state = "firingrange"

/area/station/security/execution
	icon_state = "execution_room"

/area/station/security/execution/transfer
	name = "Transfer Centre"

/area/station/security/execution/education
	name = "Prisoner Education Chamber"

/area/station/security/nuke_storage
	name = "Vault"
	icon_state = "nuke_storage"

/area/station/ai_monitored/nuke_storage
	name = "Vault"
	icon_state = "nuke_storage"

/area/station/security/checkpoint
	name = "Security Checkpoint"
	icon_state = "checkpoint1"

/area/station/security/checkpoint/auxiliary
	icon_state = "checkpoint_aux"

/area/station/security/checkpoint/escape
	icon_state = "checkpoint_esc"

/area/station/security/checkpoint/supply
	name = "Security Post - Cargo Bay"
	icon_state = "checkpoint_supp"

/area/station/security/checkpoint/engineering
	name = "Security Post - Engineering"
	icon_state = "checkpoint_engi"

/area/station/security/checkpoint/medical
	name = "Security Post - Medbay"
	icon_state = "checkpoint_med"

/area/station/security/checkpoint/science
	name = "Security Post - Science"
	icon_state = "checkpoint_sci"

/area/station/security/checkpoint/science/research
	name = "Security Post - Research Division"
	icon_state = "checkpoint_res"

/area/station/security/checkpoint/customs
	name = "Customs"
	icon_state = "customs_point"

/area/station/security/checkpoint/customs/auxiliary
	icon_state = "customs_point_aux"


//Service

/area/station/quartermaster
	name = "Quartermasters"
	icon_state = "quart"

/area/station/quartermaster/sorting
	name = "Delivery Office"
	icon_state = "cargo_delivery"

/area/station/quartermaster/warehouse
	name = "Warehouse"
	icon_state = "cargo_warehouse"

/area/station/quartermaster/office
	name = "Cargo Office"
	icon_state = "quartoffice"

/area/station/quartermaster/storage
	name = "Cargo Bay"
	icon_state = "cargo_bay"

/area/station/quartermaster/qm
	name = "Quartermaster's Office"
	icon_state = "quart"

/area/station/quartermaster/miningdock
	name = "Mining Dock"
	icon_state = "mining"

/area/station/quartermaster/miningoffice
	name = "Mining Office"
	icon_state = "mining"

/area/station/janitor
	name = "Custodial Closet"
	icon_state = "janitor"

/area/station/hydroponics
	name = "Hydroponics"
	icon_state = "hydro"

/area/station/hydroponics/garden
	name = "Garden"
	icon_state = "garden"

/area/station/hydroponics/garden/abandoned
	name = "Abandoned Garden"
	icon_state = "abandoned_garden"

/area/station/hydroponics/garden/monastery
	name = "Monastery Garden"
	icon_state = "hydro"


//Science

/area/station/science
	name = "Science Division"
	icon_state = "toxlab"

/area/station/science/lab
	name = "Research and Development"
	icon_state = "toxlab"

/area/station/science/xenobiology
	name = "Xenobiology Lab"
	icon_state = "toxlab"

/area/station/science/storage
	name = "Toxins Storage"
	icon_state = "toxstorage"

/area/station/science/test_area
	name = "Toxins Test Area"
	icon_state = "toxtest"

/area/station/science/mixing
	name = "Toxins Mixing Lab"
	icon_state = "toxmix"

/area/station/science/mixing/chamber
	name = "Toxins Mixing Chamber"
	icon_state = "toxmix"

/area/station/science/misc_lab
	name = "Testing Lab"
	icon_state = "toxmisc"

/area/station/science/misc_lab/range
	name = "Research Testing Range"
	icon_state = "toxmisc"

/area/station/science/server
	name = "Research Division Server Room"
	icon_state = "server"

/area/station/science/explab
	name = "Experimentation Lab"
	icon_state = "toxmisc"

/area/station/science/robotics
	name = "Robotics"
	icon_state = "medresearch"

/area/station/science/robotics/mechbay
	name = "Mech Bay"
	icon_state = "mechbay"

/area/station/science/robotics/lab
	name = "Robotics Lab"
	icon_state = "ass_line"

/area/station/science/research
	name = "Research Division"
	icon_state = "medresearch"

/area/station/science/research/abandoned
	name = "Abandoned Research Lab"
	icon_state = "medresearch"

/area/station/science/nanite
	name = "Nanite Lab"
	icon_state = "toxmisc"

//Storage

/area/station/storage/tools
	name = "Auxiliary Tool Storage"
	icon_state = "storage"

/area/station/storage/primary
	name = "Primary Tool Storage"
	icon_state = "primarystorage"

/area/station/storage/art
	name = "Art Supply Storage"
	icon_state = "storage"

/area/station/storage/tcom
	name = "Telecomms Storage"
	icon_state = "green"

/area/station/storage/eva
	name = "EVA Storage"
	icon_state = "eva"

/area/station/storage/emergency/starboard
	name = "Starboard Emergency Storage"
	icon_state = "emergencystorage"

/area/station/storage/emergency/port
	name = "Port Emergency Storage"
	icon_state = "emergencystorage"

/area/station/storage/tech
	name = "Technical Storage"
	icon_state = "auxstorage"

//Construction

/area/station/construction
	name = "Construction Area"
	icon_state = "yellow"
	soundscape_playlist = SCAPE_STATION_ENGINEERING

/area/station/construction/mining/aux_base
	name = "Auxiliary Base Construction"
	icon_state = "aux_base_construction"

/area/station/construction/storage_wing
	name = "Storage Wing"
	icon_state = "storage_wing"

// Vacant Rooms
/area/station/vacant_room
	name = "Vacant Room"
	soundscape_playlist = SCAPE_STATION_MAINTENANCE
	icon_state = "vacant_room"

/area/station/vacant_room/office
	name = "Vacant Office"
	icon_state = "vacant_office"

/area/station/vacant_room/commissary
	name = "Vacant Commissary"
	icon_state = "vacant_commissary"

//AI

/area/station/ai_monitored/security/armory
	name = "Armory"
	icon_state = "armory"
	soundscape_playlist = SCAPE_STATION_HIGHSEC

/area/station/ai_monitored/storage/eva
	name = "EVA Storage"
	icon_state = "eva"
	soundscape_playlist = SCAPE_STATION_HIGHSEC

/area/station/ai_monitored/storage/satellite
	name = "AI Satellite Maint"
	icon_state = "storage"
	soundscape_playlist = SCAPE_STATION_HIGHSEC

	//Turret_protected

/area/station/ai_monitored/turret_protected
	soundscape_playlist = list('sound/ambience/ambimalf.ogg', 'sound/ambience/ambitech.ogg', 'sound/ambience/ambitech2.ogg', 'sound/ambience/ambiatmos.ogg', 'sound/ambience/ambiatmos2.ogg')

/area/station/ai_monitored/turret_protected/ai_upload
	name = "AI Upload Chamber"
	icon_state = "ai_upload"

/area/station/ai_monitored/turret_protected/ai_upload_foyer
	name = "AI Upload Access"
	icon_state = "ai_foyer"

/area/station/ai_monitored/turret_protected/ai
	name = "AI Chamber"
	icon_state = "ai_chamber"

/area/station/ai_monitored/turret_protected/aisat
	name = "AI Satellite"
	icon_state = "ai"

/area/station/ai_monitored/turret_protected/aisat/atmos
	name = "AI Satellite Atmos"
	icon_state = "ai"

/area/station/ai_monitored/turret_protected/aisat/foyer
	name = "AI Satellite Foyer"
	icon_state = "ai"

/area/station/ai_monitored/turret_protected/aisat/service
	name = "AI Satellite Service"
	icon_state = "ai"

/area/station/ai_monitored/turret_protected/aisat/hallway
	name = "AI Satellite Hallway"
	icon_state = "ai"

/area/station/aisat
	name = "AI Satellite Exterior"
	icon_state = "yellow"

/area/station/ai_monitored/turret_protected/aisat_interior
	name = "AI Satellite Antechamber"
	icon_state = "ai"

/area/station/ai_monitored/turret_protected/AIsatextAS
	name = "AI Sat Ext"
	icon_state = "storage"

/area/station/ai_monitored/turret_protected/AIsatextAP
	name = "AI Sat Ext"
	icon_state = "storage"


// Telecommunications Satellite

/area/station/tcommsat
	soundscape_playlist = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg', 'sound/ambience/ambitech.ogg',\
											'sound/ambience/ambitech2.ogg', 'sound/ambience/ambitech3.ogg')

/area/station/tcommsat/computer
	name = "Telecomms Control Room"
	icon_state = "tcomsatcomp"

/area/station/tcommsat/server
	name = "Telecomms Server Room"
	icon_state = "tcomsatcham"
