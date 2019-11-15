*** Settings ****
Documentation   Host Interface test (Configuration: BMC 3.93.07 and BIOS 4.08.10)
Library     SeleniumLibrary
Library     SSHLibrary
Test Teardown   close all browsers
# Test Template   run keyword and countinue on failure


*** Variables ***
${host_addr}    172.16.32.167
${host_username}    max
${host_password}    P@ssw0rd
${username}     Administrator
${password}     superuser
${address}      172.16.33.242
${URL}  https://${username}:${password}@${address}/redfish/v1/
${CPU_num}  0   # CPU number
${MaxCPU_num}   2   # maximum CPU number
${DIMM_num}    0   # DIMM number
${MaxDIMM_num}    24  # maximum DIMM number


*** Test Cases ***

Test DMI type
    [Documentation]     Verify DMI type.
    [Tags]  dmitype42   42_test
    [Teardown]  close all connections
    Login SSH
    write     su    
    write   ${host_password}
    ${text}=    execute command   dmidecode -t 42 | grep 0x004A | awk '{print $5}' | sed 's/.$//'
    #${text}     read    delay=2
    should contain    ${text}     42






Test DMI type
    [Documentation]     Verify DMI type.
    [Tags]  dmitype42   42
    [Teardown]  close all connections
    Login SSH
    write     su    
    write   ${host_password}
    write   dmidecode -t 42 | grep 0x004A | awk '{print $5}' | sed 's/.$//'
    ${text}     read    delay=2
    should contain    ${text}     42

Test host interface type
    [Documentation]     Verify host interface type.
    [Tags]  dmitype42  host_interface_type
    [Teardown]  close all connections
    Login SSH
    write     su    
    write   ${host_password}
    write   dmidecode -t 42 | grep 'Host Interface Type'
    ${text}     read    delay=2
    should contain    ${text}     Network


Test device type
    [Documentation]     Verify device type.
    [Tags]  dmitype42  device_type
    [Teardown]  close all connections
    Login SSH
    write     su    
    write   ${host_password}
    write   dmidecode -t 42 | grep 'Device Type'
    ${text}     read    delay=2
    should contain    ${text}     USB


Test idVendor
    [Documentation]     Verify idVendor.
    [Tags]  dmitype42  idvendor
    [Teardown]  close all connections
    Login SSH
    write     su    
    write   ${host_password}
    write   dmidecode -t 42 | grep 'idVendor'
    ${text}     read    delay=2
    should contain    ${text}     0x046b


Test idProduct
    [Documentation]     Verify idProduct.
    [Tags]  dmitype42  idproduct
    [Teardown]  close all connections
    Login SSH
    write     su    
    write   ${host_password}
    write   dmidecode -t 42 | grep 'idProduct'
    ${text}     read    delay=2
    should contain    ${text}     0xffb0


Test protocol ID
    [Documentation]     Verify protocol ID.
    [Tags]  dmitype42   protocol_id
    [Teardown]  close all connections
    Login SSH
    write     su    
    write   ${host_password}
    write   dmidecode -t 42 | grep 'Protocol ID'
    ${text}     read    delay=2
    should contain    ${text}     04


Test service UUID
    [Documentation]     Verify service UUID.
    [Tags]  dmitype42  service_uuid
    [Teardown]  close all connections
    Login SSH
    write     su    
    write   ${host_password}
    write   dmidecode -t 42 | grep 'Service UUID'
    ${text}     read    delay=2
    should contain    ${text}     00306430-ba9e-d603-0010-debf0070146c


Test host IP assignment type
    [Documentation]     Verify host IP assignment type.
    [Tags]  dmitype42  host_ip_assignment_type
    [Teardown]  close all connections
    Login SSH
    write     su    
    write   ${host_password}
    write   dmidecode -t 42 | grep 'Host IP Assignment Type'
    ${text}     read    delay=2
    should contain    ${text}     Static


Test host IP address format
    [Documentation]     Verify host IP address format.
    [Tags]  dmitype42  host_ip_address_format
    [Teardown]  close all connections
    Login SSH
    write     su    
    write   ${host_password}
    write   dmidecode -t 42 | grep 'Host IP Address Format'
    ${text}     read    delay=2
    should contain    ${text}     IPv4


Test host IPv4 address
    [Documentation]     Verify host IPv4 address.
    [Tags]  dmitype42  host_ipv4_address
    [Teardown]  close all connections
    Login SSH
    write     su
    write   ${host_password}
    write   dmidecode -t 42 | grep 'IPv4 Address'
    ${text}     read    delay=2
    should contain    ${text}     1.1.1.2


Test host IPv4 mask
    [Documentation]     Verify host IPv4 mask.
    [Tags]  dmitype42  host_ipv4_mask
    [Teardown]  close all connections
    Login SSH
    write     su
    write   ${host_password}
    write   dmidecode -t 42 | grep 'IPv4 Mask'
    ${text}     read    delay=2
    should contain    ${text}     255.255.240.0


Test Redfish service IP discovery type
    [Documentation]     Verify Redfish service IP discovery type.
    [Tags]  dmitype42  redfish_service_ip_discovery_type
    [Teardown]  close all connections
    Login SSH
    write     su
    write   ${host_password}
    write   dmidecode -t 42 | grep 'Redfish Service IP Discovery Type'
    ${text}     read    delay=2
    should contain    ${text}     Static

Test Redfish service IP address format
    [Documentation]     Verify Redfish service IP address format.
    [Tags]  dmitype42  redfish_service_ip_address_format
    [Teardown]  close all connections
    Login SSH
    write     su
    write   ${host_password}
    write   dmidecode -t 42 | grep 'Redfish Service IP Address Format'
    ${text}     read    delay=2
    should contain    ${text}     IPv4


Test IPv4 Redfish service address
    [Documentation]     Verify IPv4 Redfish service address.
    [Tags]  dmitype42  ipv4_Redfish_service_address
    [Teardown]  close all connections
    Login SSH
    write     su
    write   ${host_password}
    write   dmidecode -t 42 | grep 'IPv4 Redfish Service Address'
    ${text}     read    delay=2
    should contain    ${text}     1.1.1.1


Test IPv4 Redfish service mask
    [Documentation]     Verify IPv4 Redfish service mask.
    [Tags]  dmitype42  ipv4_redfish_service_mask
    [Teardown]  close all connections
    Login SSH
    write     su
    write   ${host_password}
    write   dmidecode -t 42 | grep 'IPv4 Redfish Service Mask'
    ${text}     read    delay=2
    should contain    ${text}     255.255.240.0


Test Redfish service port
    [Documentation]     Verify Redfish service port.
    [Tags]  dmitype42  redfish_service_port
    [Teardown]  close all connections
    Login SSH
    write     su
    write   ${host_password}
    write   dmidecode -t 42 | grep 'Redfish Service Port'
    ${text}     read    delay=2
    should contain    ${text}     443


Test Redfish service vlan
    [Documentation]     Verify Redfish service vlan.
    [Tags]  dmitype42  redfish_service_vlan
    [Teardown]  close all connections
    Login SSH
    write     su
    write   ${host_password}
    write   dmidecode -t 42 | grep 'Redfish Service Vlan'
    ${text}     read    delay=2
    should contain    ${text}     0


Test /
    [Documentation]     Report root service
    [Tags]  configurations  rootservice
    [Teardown]  close all browsers
    open browser    ${URL}  ff
    wait until element contains     //*[@id="/Id"]    "RootService"
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Root Service"

Test /BiosStaticFiles
    [Documentation]     Report BIOS static files
    [Tags]  configurations  biosstaticfiles
    [Teardown]  close all browsers
    open browser    ${URL}BiosStaticFiles  ff
    wait until element contains     //*[@id="/Name"]    "BIOS static files"

Test /configurations
    [Documentation]     Report configurations
    [Tags]  configurations
    [Teardown]  close all browsers
    open browser    ${URL}configurations  ff
    wait until element contains     //*[@id="/Name"]    "Certificate configurations"

Test /TaskService
    [Documentation]     Report task service
    [Tags]  configurations  TaskService
    [Teardown]  close all browsers
    open browser    ${URL}TaskService  ff
    wait until element contains     //*[@id="/Id"]    "TaskService"
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "TaskService"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

Test /UpdateService
    [Documentation]     Report update service
    [Tags]  configurations  UpdateService
    [Teardown]  close all browsers
    open browser    ${URL}UpdateService  ff
    wait until element contains     //*[@id="/Id"]    "UpdateService"
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Update Service"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

Test /Processors/DevType1_CPU0 and 1
    [Documentation]     Report processors.
    [Tags]  system inventory  processors
    [Teardown]  close all browsers
    :FOR    ${CPU_num}    IN RANGE      2
    \   open browser    ${URL}Systems/Self/Processors/DevType1_CPU${CPU_num}  ff
    \   wait until element contains     //*[@id="/Id"]    DevType1_CPU${CPU_num}
    \   ${text}=    get text    //*[@id="/Manufacturer"]
    \   should match  ${text}    Manufacturer "Intel(R) Corporation"
    \   ${text}=    get text    //*[@id="/MaxSpeedMHz"]
    \   should match  ${text}    MaxSpeedMHz 3900
    \   ${text}=    get text    //*[@id="/Model"]
    \   should match  ${text}    Model "Intel(R) Xeon(R) Gold 6230 CPU @ 2.10GHz, 3900 Mhz, 20 Core(s), 40 Logical Processor(s)"
    \   ${text}=    get text    //*[@id="/Name"]
    \   should match  ${text}    Name "DevType1_CPU${CPU_num}"
    \   ${text}=    get text    //*[@id="/ProcessorArchitecture"]
    \   should match  ${text}    ProcessorArchitecture "x86"
    \   ${text}=    get text    //*[@id="/ProcessorId/EffectiveFamily"]
    \   should match  ${text}    EffectiveFamily "Intel(R) Xeon(R) Gold 6230 CPU @ 2.10GHz"
    \   ${text}=    get text    //*[@id="/ProcessorType"]
    \   should match  ${text}    ProcessorType "CPU"
    \   ${text}=    get text    //*[@id="/Socket"]
    \   should match  ${text}    Socket "${CPU_num}"
    \   ${text}=    get text    //*[@id="/Status/Health"]
    \   should match  ${text}    Health "OK"
    \   ${text}=    get text    //*[@id="/Status/State"]
    \   should match  ${text}    State "Enabled"
    \   ${text}=    get text    //*[@id="/TotalCores"]
    \   should match  ${text}    TotalCores 20
    \   ${text}=    get text    //*[@id="/TotalThreads"]
    \   should match  ${text}    TotalThreads 40
    \   close all browsers

Test /Memory/DevType2_DIMM0, 2, 4, ..., 22
    [Documentation]     Report memory modules.
    [Tags]  system inventory  memory
    [Teardown]  close all browsers
    :FOR    ${DIMM_num}    IN RANGE    ${DIMM_num}    ${MaxDIMM_num}    2
    \   open browser    ${URL}Systems/Self/Memory/DevType2_DIMM${DIMM_num}  ff
    \   wait until element contains     //*[@id="/Id"]    DevType2_DIMM${DIMM_num}
    \   ${text}=    get text    //*[@id="/AllowedSpeedsMHz/0"]
    \   should match  ${text}    0 2933
    \   ${text}=    get text    //*[@id="/BaseModuleType"]
    \   should match  ${text}    BaseModuleType "RDIMM"
    \   ${text}=    get text    //*[@id="/BusWidthBits"]
    \   should match  ${text}    BusWidthBits 72
    \   ${text}=    get text    //*[@id="/CapacityMiB"]
    \   should match  ${text}    CapacityMiB 32768
    \   ${text}=    get text    //*[@id="/DataWidthBits"]
    \   should match  ${text}    DataWidthBits 64
    \   ${text}=    get text    //*[@id="/Id"]
    \   should match  ${text}    Id "DevType2_DIMM${DIMM_num}"
    \   ${text}=    get text    //*[@id="/MemoryDeviceType"]
    \   should match  ${text}    MemoryDeviceType "DDR4"
    \   ${text}=    get text    //*[@id="/Name"]
    \   should match  ${text}    Name "DevType2_DIMM${DIMM_num}"
    \   ${text}=    get text    //*[@id="/OperatingSpeedMhz"]
    \   run keyword and continue on failure     should match  ${text}    OperatingSpeedMhz 2933
    \   ${text}=    get text    //*[@id="/PartNumber"]
    \   run keyword and continue on failure     should match  ${text}    PartNumber "MTA36ASF4G72PZ-2G9E2TG"
    \   close all browsers

Test /Storage/1
    [Documentation]     Report storages.
    [Tags]  system inventory  storages
    [Teardown]  close all browsers
    open browser    ${URL}Systems/Self/Storage/1  ff
    wait until element contains     //*[@id="/Id"]      1
    ${text}=    get text    //*[@id="/Drives/0/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/Storage/1/Drives/SATA_Device3_Port5"
    ${text}=    get text    //*[@id="/Drives/1/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/Storage/1/Drives/USB_Device7_Port2"
    ${text}=    get text    //*[@id="/Drives/2/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/Storage/1/Drives/USB_Device5_Port2"
    ${text}=    get text    //*[@id="/Drives/3/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/Storage/1/Drives/USB_Device4_Port10"
    ${text}=    get text    //*[@id="/Drives/4/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/Storage/1/Drives/USB_Device6_Port2"
    ${text}=    get text    //*[@id="/Drives/5/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/Storage/1/Drives/SATA_Device2_Port4"
    ${text}=    get text    //*[@id="/Drives/6/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/Storage/1/Drives/SATA_Device1_Port3"
    ${text}=    get text    //*[@id="/Drives/7/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/Storage/1/Drives/SATA_Device0_Port2"
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Local Storage Controller"
    ${text}=    get text    //*[@id="/StorageControllers/0/MemberId"]
    should match  ${text}    MemberId "SATA_Controller_0"
    ${text}=    get text    //*[@id="/StorageControllers/0/SpeedGbps"]
    should match  ${text}    SpeedGbps 6
    ${text}=    get text    //*[@id="/StorageControllers/0/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/StorageControllers/0/Status/State"]
    should match  ${text}    State "Enabled"
    ${text}=    get text    //*[@id="/StorageControllers/1/MemberId"]
    should match  ${text}    MemberId "USB_Controller1"
    ${text}=    get text    //*[@id="/StorageControllers/1/SpeedGbps"]
    should match  ${text}    SpeedGbps 3
    ${text}=    get text    //*[@id="/StorageControllers/1/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/StorageControllers/1/Status/State"]
    should match  ${text}    State "Enabled"
    ${text}=    get text    //*[@id="/StorageControllers/2/MemberId"]
    should match  ${text}    MemberId "SATA_Controller_2"
    ${text}=    get text    //*[@id="/StorageControllers/2/SpeedGbps"]
    should match  ${text}    SpeedGbps 6
    ${text}=    get text    //*[@id="/StorageControllers/2/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/StorageControllers/2/Status/State"]
    should match  ${text}    State "Enabled"

Test /Storage/1/Volumes
    [Documentation]     Report volumes information.
    [Tags]  system inventory  storage   volumes
    [Teardown]  close all browsers
    open browser    ${URL}Systems/Self/Storage/1/Volumes  ff
    wait until element contains     //*[@id="/Name"]      Volume Collection
    ${text}=    get text    //*[@id="/Members/0/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/Storage/1/Volumes/VOL0"
    ${text}=    get text    //*[@id="/Members/1/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/Storage/1/Volumes/VOL1"

Test /Storage/1/Volumes/VOL0
    [Documentation]     Report VOL0 information.
    [Tags]  system inventory  storage   vol0
    [Teardown]  close all browsers
    open browser    ${URL}Systems/Self/Storage/1/Volumes/VOL0  ff
    wait until element contains     //*[@id="/Id"]      VOL0
    ${text}=    get text    //*[@id="/BlockSizeBytes"]
    should match  ${text}    BlockSizeBytes 2048
    ${text}=    get text    //*[@id="/CapacityBytes"]
    should match  ${text}    CapacityBytes 51261440
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "VOL0"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"
    ${text}=    get text    //*[@id="/VolumeType"]
    should match  ${text}    VolumeType "RawDevice"

Test /Storage/1/Volumes/VOL1
    [Documentation]     Report VOL1 information.
    [Tags]  system inventory  storage   vol1
    [Teardown]  close all browsers
    open browser    ${URL}Systems/Self/Storage/1/Volumes/VOL1  ff
    wait until element contains     //*[@id="/Id"]      VOL1
    ${text}=    get text    //*[@id="/BlockSizeBytes"]
    should match  ${text}    BlockSizeBytes 2048
    ${text}=    get text    //*[@id="/CapacityBytes"]
    should match  ${text}    CapacityBytes 103569408
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "VOL1"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"
    ${text}=    get text    //*[@id="/VolumeType"]
    should match  ${text}    VolumeType "RawDevice"

Test network adapters
    [Documentation]     Detect NICs including onboard (physical/virtual) NIC and addon NIC.
    [Tags]  system inventory  network adapter collection
    [Teardown]  close all browsers
    open browser    ${URL}Chassis/Self/NetworkAdapters  ff
    wait until element contains     //*[@id="/Name"]      NetworkAdapter Collection
    ${text}=    get text    //*[@id="/Members/0/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Chassis/Self/NetworkAdapters/DevType7_VirtualNic4"
    ${text}=    get text    //*[@id="/Members/1/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Chassis/Self/NetworkAdapters/DevType7_NIC0"
    ${text}=    get text    //*[@id="/Members/2/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Chassis/Self/NetworkAdapters/DevType7_NIC3"
    ${text}=    get text    //*[@id="/Members/3/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Chassis/Self/NetworkAdapters/DevType7_NIC2"
    ${text}=    get text    //*[@id="/Members/4/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Chassis/Self/NetworkAdapters/DevType7_NIC1"

Test /NetworkAdapters/DevType7_VirtualNic4
    [Documentation]     Report network adapter health and state.
    [Tags]  system inventory  network   DevType7_VirtualNic4    DevType3_XHCI_DevIndex10    DevType7_VirtualNic4_PORT0
    [Teardown]  close all browsers

    ${device}=   set variable   DevType7_VirtualNic4
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Network Adapter View"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"
    
    ${function}=    set variable    DevType3_XHCI_DevIndex10
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}/NetworkDeviceFunctions/${function}  ff
    wait until element contains     //*[@id="/Id"]      ${function}
    ${text}=    get text    //*[@id="/Ethernet/MACAddress"]
    should match  ${text}    MACAddress "3A:03:0C:69:C6:66"
    ${text}=    get text    //*[@id="/Ethernet/MTUSize"]
    should match  ${text}    MTUSize 1542
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Network Device Function View"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"
    
    ${post}=    set variable    DevType7_VirtualNic4_PORT0
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}/NetworkPorts/${port}  ff
    wait until element contains     //*[@id="/Id"]      ${port}

Test /NetworkAdapters/DevType7_NIC0
    [Documentation]     Report network adapter health and state.
    [Tags]  system inventory  network   DevType7_NIC0   DevType3_SLT2_DevIndex1     
    ...     DevType3_SLT2_DevIndex2     DevType7_Slot2_Instance0_PORT0      DevType7_Slot2_Instance1_PORT1
    [Teardown]  close all browsers

    ${device}=   set variable   DevType7_NIC0
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Network Adapter View"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"
    
    ${function}=    set variable    DevType3_SLT2_DevIndex1
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}/NetworkDeviceFunctions/${function}  ff
    wait until element contains     //*[@id="/Id"]      ${function}
    ${text}=    get text    //*[@id="/Ethernet/MACAddress"]
    run keyword and continue on failure     should match  ${text}    MACAddress "ff:ff:ff:ff:ff:ff"
    ${text}=    get text    //*[@id="/Ethernet/MTUSize"]
    run keyword and continue on failure     should match  ${text}    MTUSize 1542
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Network Device Function View"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"
    
    ${function}=    set variable    DevType3_SLT2_DevIndex2
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}/NetworkDeviceFunctions/${function}  ff
    wait until element contains     //*[@id="/Id"]      ${function}
    ${text}=    get text    //*[@id="/Ethernet/MACAddress"]
    run keyword and continue on failure     should match  ${text}    MACAddress "ff:ff:ff:ff:ff:ff"
    ${text}=    get text    //*[@id="/Ethernet/MTUSize"]
    run keyword and continue on failure     should match  ${text}    MTUSize 1542
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Network Device Function View"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

    ${post}=    set variable    DevType7_Slot2_Instance0_PORT0
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}/NetworkPorts/${port}  ff
    run keyword and continue on failure     wait until element contains     //*[@id="/Id"]      ${port}

    ${post}=    set variable    DevType7_Slot2_Instance0_PORT1
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}/NetworkPorts/${port}  ff
    run keyword and continue on failure     wait until element contains     //*[@id="/Id"]      ${port}

Test /NetworkAdapters/DevType7_NIC1
    [Documentation]     Report network adapter health and state.
    [Tags]  system inventory  network   DevType7_NIC1   DevType3_SLT8_DevIndex5     DevType3_SLT8_DevIndex6
    ...     DevType3_SLT8_DevIndex7     DevType3_SLT8_DevIndex8     DevType7_Slot8_Instance2_PORT0
    ...     DevType7_Slot8_Instance3_PORT1      DevType7_Slot8_Instance4_PORT2      
    ...     DevType7_Slot8_Instance5_PORT3
    [Teardown]  close all browsers

    ${device}=   set variable   DevType7_NIC1
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Network Adapter View"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

    ${function}=    set variable    DevType3_SLT8_DevIndex5
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}/NetworkDeviceFunctions/${function}  ff
    wait until element contains     //*[@id="/Id"]      ${function}
    ${text}=    get text    //*[@id="/Ethernet/MACAddress"]
    run keyword and continue on failure     should match  ${text}    MACAddress "ff:ff:ff:ff:ff:ff"
    ${text}=    get text    //*[@id="/Ethernet/MTUSize"]
    run keyword and continue on failure     should match  ${text}    MTUSize 1542
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Network Device Function View"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"
    
    ${function}=    set variable    DevType3_SLT8_DevIndex6
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}/NetworkDeviceFunctions/${function}  ff
    wait until element contains     //*[@id="/Id"]      ${function}
    ${text}=    get text    //*[@id="/Ethernet/MACAddress"]
    run keyword and continue on failure     should match  ${text}    MACAddress "ff:ff:ff:ff:ff:ff"
    ${text}=    get text    //*[@id="/Ethernet/MTUSize"]
    run keyword and continue on failure     should match  ${text}    MTUSize 1542
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Network Device Function View"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

    ${function}=    set variable    DevType3_SLT8_DevIndex7
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}/NetworkDeviceFunctions/${function}  ff
    wait until element contains     //*[@id="/Id"]      ${function}
    ${text}=    get text    //*[@id="/Ethernet/MACAddress"]
    run keyword and continue on failure     should match  ${text}    MACAddress "ff:ff:ff:ff:ff:ff"
    ${text}=    get text    //*[@id="/Ethernet/MTUSize"]
    run keyword and continue on failure     should match  ${text}    MTUSize 1542
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Network Device Function View"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

    ${function}=    set variable    DevType3_SLT8_DevIndex8
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}/NetworkDeviceFunctions/${function}  ff
    wait until element contains     //*[@id="/Id"]      ${function}
    ${text}=    get text    //*[@id="/Ethernet/MACAddress"]
    run keyword and continue on failure     should match  ${text}    MACAddress "ff:ff:ff:ff:ff:ff"
    ${text}=    get text    //*[@id="/Ethernet/MTUSize"]
    run keyword and continue on failure     should match  ${text}    MTUSize 1542
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Network Device Function View"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

    ${post}=    set variable    DevType7_Slot8_Instance2_PORT0
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}/NetworkPorts/${port}  ff
    run keyword and continue on failure     wait until element contains     //*[@id="/Id"]      ${port}

    ${post}=    set variable    DevType7_Slot8_Instance3_PORT1
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}/NetworkPorts/${port}  ff
    run keyword and continue on failure     wait until element contains     //*[@id="/Id"]      ${port}

    ${post}=    set variable    DevType7_Slot8_Instance4_PORT2
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}/NetworkPorts/${port}  ff
    run keyword and continue on failure     wait until element contains     //*[@id="/Id"]      ${port}

    ${post}=    set variable    DevType7_Slot8_Instance5_PORT3
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}/NetworkPorts/${port}  ff
    run keyword and continue on failure     wait until element contains     //*[@id="/Id"]      ${port}

Test /NetworkAdapters/DevType7_NIC2
    [Documentation]     Report network adapter health and state.
    [Tags]  system inventory  network   DevType7_NIC2   DevType3_LAN1_DevIndex1A    
    ...     DevType7_Slot0_Instance6_PORT0  DevType7_Slot0_Instance6_PORT0
    [Teardown]  close all browsers

    ${device}=   set variable   DevType7_NIC2
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Network Adapter View"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"
    
    ${function}=    set variable    DevType3_LAN1_DevIndex1A
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}/NetworkDeviceFunctions/${function}  ff
    wait until element contains     //*[@id="/Id"]      ${function}
    ${text}=    get text    //*[@id="/Ethernet/MACAddress"]
    run keyword and continue on failure     should match  ${text}    MACAddress "00:30:64:30:ba:a0"
    ${text}=    get text    //*[@id="/Ethernet/MTUSize"]
    run keyword and continue on failure     should match  ${text}    MTUSize 1542
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Network Device Function View"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

    ${post}=    set variable    DevType7_Slot0_Instance6_PORT0
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}/NetworkPorts/${port}  ff
    run keyword and continue on failure     wait until element contains     //*[@id="/Id"]      ${port}

Test /NetworkAdapters/DevType7_NIC3
    [Documentation]     Report network adapter health and state.
    [Tags]  system inventory  network   DevType7_NIC3
    [Teardown]  close all browsers

    ${device}=   set variable   DevType7_NIC3
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Network Adapter View"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"
    
    ${function}=    set variable    DevType3_DMMY_DevIndex26
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}/NetworkDeviceFunctions/${function}  ff
    wait until element contains     //*[@id="/Id"]      ${function}
    ${text}=    get text    //*[@id="/Ethernet/MACAddress"]
    run keyword and continue on failure     should match  ${text}    MACAddress "ff:ff:ff:ff:ff:ff"
    ${text}=    get text    //*[@id="/Ethernet/MTUSize"]
    run keyword and continue on failure     should match  ${text}    MTUSize 1542
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Network Device Function View"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"
    
    ${function}=    set variable    DevType3_EPCU_DevIndex25
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}/NetworkDeviceFunctions/${function}  ff
    wait until element contains     //*[@id="/Id"]      ${function}
    ${text}=    get text    //*[@id="/Ethernet/MACAddress"]
    run keyword and continue on failure     should match  ${text}    MACAddress "ff:ff:ff:ff:ff:ff"
    ${text}=    get text    //*[@id="/Ethernet/MTUSize"]
    run keyword and continue on failure     should match  ${text}    MTUSize 1542
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Network Device Function View"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"


    ${post}=    set variable    DevType7_Slot1_Instance7_PORT0
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}/NetworkPorts/${port}  ff
    run keyword and continue on failure     wait until element contains     //*[@id="/Id"]      ${port}

    ${post}=    set variable    DevType7_Slot1_Instance8_PORT1
    open browser    ${URL}Chassis/Self/NetworkAdapters/${device}/NetworkPorts/${port}  ff
    run keyword and continue on failure     wait until element contains     //*[@id="/Id"]      ${port}

Test ethernet interfaces
    [Documentation]     Detect ethernet interfaces including the interface is from onboard/addon NICs.
    [Tags]  system inventory  network       ethernet interface collection
    [Teardown]  close all browsers
    open browser    ${URL}Systems/Self/EthernetInterfaces  ff
    wait until element contains     //*[@id="/Name"]      Ethernet Interface Collection
    ${text}=    get text    //*[@id="/Members/0/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/EthernetInterfaces/NicInterface2"
    ${text}=    get text    //*[@id="/Members/1/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/EthernetInterfaces/NicInterface1"
    ${text}=    get text    //*[@id="/Members/2/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/EthernetInterfaces/NicInterface6"
    ${text}=    get text    //*[@id="/Members/3/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/EthernetInterfaces/NicInterface5"
    ${text}=    get text    //*[@id="/Members/4/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/EthernetInterfaces/NicInterface8"
    ${text}=    get text    //*[@id="/Members/5/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/EthernetInterfaces/NicInterface3"
    ${text}=    get text    //*[@id="/Members/6/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/EthernetInterfaces/NicInterface7"
    ${text}=    get text    //*[@id="/Members/7/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/EthernetInterfaces/NicInterface4"
    ${text}=    get text    //*[@id="/Members/8/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/EthernetInterfaces/VirtualNicInterface3F"
    ${text}=    get text    //*[@id="/Members/9/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/EthernetInterfaces/NicInterface0"

Test /EthernetInterfaces/NicInterface0
    [Documentation]     Report ethernet interface.
    [Tags]  system inventory  network NicInterface0
    [Teardown]  close all browsers

    ${interface}=   set variable    NicInterface0
    open browser    ${URL}Systems/Self/EthernetInterfaces/${interface}  ff
    wait until element contains     //*[@id="/Id"]      ${interface}
    ${text}=    get text    //*[@id="/InterfaceEnabled"]
    should match  ${text}    InterfaceEnabled true
    ${text}=    get text    //*[@id="/LinkStatus"]
    should match  ${text}    LinkStatus "LinkUp"
    ${text}=    get text    //*[@id="/MACAddress"]
    should match  ${text}    MACAddress "ff:ff:ff:ff:ff:ff"
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Ethernet Interface"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

Test /EthernetInterfaces/NicInterface1
    [Documentation]     Report ethernet interface.
    [Tags]  system inventory  network NicInterface1
    [Teardown]  close all browsers

    ${interface}=   set variable    NicInterface1
    open browser    ${URL}Systems/Self/EthernetInterfaces/${interface}  ff
    wait until element contains     //*[@id="/Id"]      ${interface}
    ${text}=    get text    //*[@id="/InterfaceEnabled"]
    should match  ${text}    InterfaceEnabled true
    ${text}=    get text    //*[@id="/LinkStatus"]
    should match  ${text}    LinkStatus "LinkUp"
    ${text}=    get text    //*[@id="/MACAddress"]
    should match  ${text}    MACAddress "ff:ff:ff:ff:ff:ff"
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Ethernet Interface"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

Test /EthernetInterfaces/NicInterface2
    [Documentation]     Report ethernet interface.
    [Tags]  system inventory  network NicInterface2
    [Teardown]  close all browsers

    ${interface}=   set variable    NicInterface2
    open browser    ${URL}Systems/Self/EthernetInterfaces/${interface}  ff
    wait until element contains     //*[@id="/Id"]      ${interface}
    ${text}=    get text    //*[@id="/InterfaceEnabled"]
    should match  ${text}    InterfaceEnabled true
    ${text}=    get text    //*[@id="/LinkStatus"]
    should match  ${text}    LinkStatus "LinkUp"
    ${text}=    get text    //*[@id="/MACAddress"]
    should match  ${text}    MACAddress "ff:ff:ff:ff:ff:ff"
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Ethernet Interface"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

Test /EthernetInterfaces/NicInterface3
    [Documentation]     Report ethernet interface.
    [Tags]  system inventory  network NicInterface3
    [Teardown]  close all browsers

    ${interface}=   set variable    NicInterface3
    open browser    ${URL}Systems/Self/EthernetInterfaces/${interface}  ff
    wait until element contains     //*[@id="/Id"]      ${interface}
    ${text}=    get text    //*[@id="/InterfaceEnabled"]
    should match  ${text}    InterfaceEnabled true
    ${text}=    get text    //*[@id="/LinkStatus"]
    should match  ${text}    LinkStatus "LinkUp"
    ${text}=    get text    //*[@id="/MACAddress"]
    should match  ${text}    MACAddress "ff:ff:ff:ff:ff:ff"
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Ethernet Interface"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

Test /EthernetInterfaces/NicInterface4
    [Documentation]     Report ethernet interface.
    [Tags]  system inventory  network NicInterface4
    [Teardown]  close all browsers

    ${interface}=   set variable    NicInterface4
    open browser    ${URL}Systems/Self/EthernetInterfaces/${interface}  ff
    wait until element contains     //*[@id="/Id"]      ${interface}
    ${text}=    get text    //*[@id="/InterfaceEnabled"]
    should match  ${text}    InterfaceEnabled true
    ${text}=    get text    //*[@id="/LinkStatus"]
    should match  ${text}    LinkStatus "LinkUp"
    ${text}=    get text    //*[@id="/MACAddress"]
    should match  ${text}    MACAddress "ff:ff:ff:ff:ff:ff"
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Ethernet Interface"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

Test /EthernetInterfaces/NicInterface5
    [Documentation]     Report ethernet interface.
    [Tags]  system inventory  network NicInterface5
    [Teardown]  close all browsers

    ${interface}=   set variable    NicInterface5
    open browser    ${URL}Systems/Self/EthernetInterfaces/${interface}  ff
    wait until element contains     //*[@id="/Id"]      ${interface}
    ${text}=    get text    //*[@id="/InterfaceEnabled"]
    should match  ${text}    InterfaceEnabled true
    ${text}=    get text    //*[@id="/LinkStatus"]
    should match  ${text}    LinkStatus "LinkUp"
    ${text}=    get text    //*[@id="/MACAddress"]
    should match  ${text}    MACAddress "ff:ff:ff:ff:ff:ff"
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Ethernet Interface"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

Test /EthernetInterfaces/NicInterface6
    [Documentation]     Report ethernet interface.
    [Tags]  system inventory  network NicInterface6
    [Teardown]  close all browsers

    ${interface}=   set variable    NicInterface6
    open browser    ${URL}Systems/Self/EthernetInterfaces/${interface}  ff
    wait until element contains     //*[@id="/Id"]      ${interface}
    ${text}=    get text    //*[@id="/InterfaceEnabled"]
    should match  ${text}    InterfaceEnabled true
    ${text}=    get text    //*[@id="/LinkStatus"]
    should match  ${text}    LinkStatus "LinkUp"
    ${text}=    get text    //*[@id="/MACAddress"]
    should match  ${text}    MACAddress "ff:ff:ff:ff:ff:ff"
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Ethernet Interface"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

Test /EthernetInterfaces/NicInterface7
    [Documentation]     Report ethernet interface.
    [Tags]  system inventory  network NicInterface7
    [Teardown]  close all browsers

    ${interface}=   set variable    NicInterface7
    open browser    ${URL}Systems/Self/EthernetInterfaces/${interface}  ff
    wait until element contains     //*[@id="/Id"]      ${interface}
    ${text}=    get text    //*[@id="/InterfaceEnabled"]
    should match  ${text}    InterfaceEnabled true
    ${text}=    get text    //*[@id="/LinkStatus"]
    should match  ${text}    LinkStatus "LinkUp"
    ${text}=    get text    //*[@id="/MACAddress"]
    should match  ${text}    MACAddress "ff:ff:ff:ff:ff:ff"
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Ethernet Interface"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

Test /EthernetInterfaces/NicInterface8
    [Documentation]     Report ethernet interface.
    [Tags]  system inventory  network NicInterface8
    [Teardown]  close all browsers

    ${interface}=   set variable    NicInterface8
    open browser    ${URL}Systems/Self/EthernetInterfaces/${interface}  ff
    wait until element contains     //*[@id="/Id"]      ${interface}
    ${text}=    get text    //*[@id="/InterfaceEnabled"]
    should match  ${text}    InterfaceEnabled true
    ${text}=    get text    //*[@id="/LinkStatus"]
    should match  ${text}    LinkStatus "LinkUp"
    ${text}=    get text    //*[@id="/MACAddress"]
    should match  ${text}    MACAddress "ff:ff:ff:ff:ff:ff"
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Ethernet Interface"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

Test /EthernetInterfaces/VirtualNicInterface3F
    [Documentation]     Report ethernet interface.
    [Tags]  system inventory  network VirtualNicInterface3F
    [Teardown]  close all browsers

    ${interface}=   set variable    VirtualNicInterface3F
    open browser    ${URL}Systems/Self/EthernetInterfaces/${interface}  ff
    wait until element contains     //*[@id="/Id"]      ${interface}
    ${text}=    get text    //*[@id="/InterfaceEnabled"]
    should match  ${text}    InterfaceEnabled true
    ${text}=    get text    //*[@id="/LinkStatus"]
    should match  ${text}    LinkStatus "LinkUp"
    ${text}=    get text    //*[@id="/MACAddress"]
    should match  ${text}    MACAddress "3A:03:0C:69:C6:66"
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Ethernet Interface"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

Test network interfaces
    [Documentation]     Detect network interfaces including the interface is from onboard/addon NICs.
    [Tags]  system inventory  network       network interface collection
    [Teardown]  close all browsers
    open browser    ${URL}Systems/Self/NetworkInterfaces  ff
    wait until element contains     //*[@id="/Name"]      NetworkInterface Collection
    ${text}=    get text    //*[@id="/Members/0/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/NetworkInterfaces/DevType7_VirtualNic4"
    ${text}=    get text    //*[@id="/Members/1/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/NetworkInterfaces/DevType7_NIC2"
    ${text}=    get text    //*[@id="/Members/2/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/NetworkInterfaces/DevType7_NIC0"
    ${text}=    get text    //*[@id="/Members/3/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/NetworkInterfaces/DevType7_NIC3"
    ${text}=    get text    //*[@id="/Members/4/@odata.id"]
    should match  ${text}    @odata.id "/redfish/v1/Systems/Self/NetworkInterfaces/DevType7_NIC1"

Test /NetworkInterfaces/DevType7_NIC0
    [Documentation]     Report physical network interface.
    [Tags]  system inventory  network       DevType7_NIC0
    [Teardown]  close all browsers

    ${interface}=   set variable    DevType7_NIC0
    open browser    ${URL}Systems/Self/NetworkInterfaces/${interface}  ff
    wait until element contains     //*[@id="/Id"]      ${interface}
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Network Interface View"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

    ${function}=    set variable    DevType7_NIC0
    open browser    ${URL}Systems/Self/NetworkInterfaces/${interface}/NetworkDeviceFunctions/${function}  ff
    run keyword and continue on failure     wait until element contains     //*[@id="/Id"]      ${function}

    ${port}=    set variable    DevType7_NIC0
    open browser    ${URL}Systems/Self/NetworkInterfaces/${interface}/NetworkPorts/${port}  ff
    run keyword and continue on failure     wait until element contains     //*[@id="/Id"]      ${port}

Test /NetworkInterfaces/DevType7_NIC1
    [Documentation]     Report physical network interface.
    [Tags]  system inventory  network       DevType7_NIC1
    [Teardown]  close all browsers

    ${interface}=   set variable    DevType7_NIC1
    open browser    ${URL}Systems/Self/NetworkInterfaces/${interface}  ff
    wait until element contains     //*[@id="/Id"]      ${interface}
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Network Interface View"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

    ${function}=    set variable    DevType7_NIC1
    open browser    ${URL}Systems/Self/NetworkInterfaces/${interface}/NetworkDeviceFunctions/${function}  ff
    run keyword and continue on failure     wait until element contains     //*[@id="/Id"]      ${function}

    ${port}=    set variable    DevType7_NIC1
    open browser    ${URL}Systems/Self/NetworkInterfaces/${interface}/NetworkPorts/${port}  ff
    run keyword and continue on failure     wait until element contains     //*[@id="/Id"]      ${port}

Test /NetworkInterfaces/DevType7_NIC2
    [Documentation]     Report physical network interface.
    [Tags]  system inventory  network       DevType7_NIC2
    [Teardown]  close all browsers

    ${interface}=   set variable    DevType7_NIC2
    open browser    ${URL}Systems/Self/NetworkInterfaces/${interface}  ff
    wait until element contains     //*[@id="/Id"]      ${interface}
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Network Interface View"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

    ${function}=    set variable    DevType7_NIC2
    open browser    ${URL}Systems/Self/NetworkInterfaces/${interface}/NetworkDeviceFunctions/${function}  ff
    run keyword and continue on failure     wait until element contains     //*[@id="/Id"]      ${function}

    ${port}=    set variable    DevType7_NIC2
    open browser    ${URL}Systems/Self/NetworkInterfaces/${interface}/NetworkPorts/${port}  ff
    run keyword and continue on failure     wait until element contains     //*[@id="/Id"]      ${port}

Test /NetworkInterfaces/DevType7_NIC3
    [Documentation]     Report physical network interface.
    [Tags]  system inventory  network       DevType7_NIC3
    [Teardown]  close all browsers

    ${interface}=   set variable    DevType7_NIC3
    open browser    ${URL}Systems/Self/NetworkInterfaces/${interface}  ff
    wait until element contains     //*[@id="/Id"]      ${interface}
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Network Interface View"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

    ${function}=    set variable    DevType7_NIC3
    open browser    ${URL}Systems/Self/NetworkInterfaces/${interface}/NetworkDeviceFunctions/${function}  ff
    run keyword and continue on failure     wait until element contains     //*[@id="/Id"]      ${function}

    ${port}=    set variable    DevType7_NIC3
    open browser    ${URL}Systems/Self/NetworkInterfaces/${interface}/NetworkPorts/${port}  ff
    run keyword and continue on failure     wait until element contains     //*[@id="/Id"]      ${port}

Test /NetworkInterfaces/DevType7_VirtualNic4
    [Documentation]     Report physical network interface.
    [Tags]  system inventory  network       DevType7_VirtualNic4
    [Teardown]  close all browsers

    ${interface}=   set variable    DevType7_VirtualNic4
    open browser    ${URL}Systems/Self/NetworkInterfaces/${interface}  ff
    wait until element contains     //*[@id="/Id"]      ${interface}
    ${text}=    get text    //*[@id="/Name"]
    should match  ${text}    Name "Network Interface View"
    ${text}=    get text    //*[@id="/Status/Health"]
    should match  ${text}    Health "OK"
    ${text}=    get text    //*[@id="/Status/State"]
    should match  ${text}    State "Enabled"

    ${function}=    set variable    DevType7_VirtualNic4
    open browser    ${URL}Systems/Self/NetworkInterfaces/${interface}/NetworkDeviceFunctions/${function}  ff
    run keyword and continue on failure     wait until element contains     //*[@id="/Id"]      ${function}

    ${port}=    set variable    DevType7_VirtualNic4
    open browser    ${URL}Systems/Self/NetworkInterfaces/${interface}/NetworkPorts/${port}  ff
    run keyword and continue on failure     wait until element contains     //*[@id="/Id"]      ${port}

Test PCIe device /00_00_00
    [Tags]  system inventory  PCIe device   00_00_00
    [Teardown]  close all browsers
    ${text}=   set variable   00_00_00
    open browser    ${URL}Chassis/Self/PCIeDevices/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_00/Functions/DevType3_DMI0_DevIndex7
    [Tags]  system inventory    PCIe device     DevType3_DMI0_DevIndex7
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_DMI0_DevIndex7
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_00/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_00/Functions/DevType3_SLT1_DevIndex0
    [Tags]  system inventory  PCIe device   DevType3_SLT1_DevIndex0
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_SLT1_DevIndex0
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_00/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_00/Functions/DevType3_SLT2_DevIndex1
    [Tags]  system inventory  PCIe device   DevType3_SLT2_DevIndex1
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_SLT2_DevIndex1
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_00/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_00/Functions/DevType3_SLT4_DevIndex3
    [Tags]  system inventory    PCIe device     DevType3_SLT4_DevIndex3
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_SLT4_DevIndex3
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_00/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_00/Functions/DevType3_SLT5_DevIndex5
    [Tags]  system inventory    PCIe device     DevType3_SLT5_DevIndex5
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_SLT5_DevIndex5
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_00/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_00/Functions/DevType3_SLT6_DevIndex2
    [Tags]  system inventory    PCIe device     DevType3_SLT6_DevIndex2
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_SLT6_DevIndex2
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_00/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_00/Functions/DevType3_SLT7_DevIndex6
    [Tags]  system inventory    PCIe device     DevType3_SLT7_DevIndex6
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_SLT7_DevIndex6
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_00/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_00/Functions/DevType3_SLT8_DevIndex4
    [Tags]  system inventory    PCIe device     DevType3_SLT8_DevIndex4
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_SLT8_DevIndex4
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_00/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_08
    [Tags]  system inventory    PCIe device     00_00_08
    [Teardown]  close all browsers
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_08  ff
    wait until element contains     //*[@id="/Id"]      00_00_08

Test PCIe device /00_00_08/Functions/DevType3_DMMY_DevIndex8
    [Tags]  system inventory    PCIe device     DevType3_DMMY_DevIndex8
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_DMMY_DevIndex8
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_08/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_11
    [Tags]  system inventory    PCIe device     00_00_11
    [Teardown]  close all browsers
    ${text}=   set variable   00_00_11
    open browser    ${URL}Chassis/Self/PCIeDevices/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_11/Functions/DevType3_MRO0_DevIndex9
    [Tags]  system inventory    PCIe device     DevType3_MRO0_DevIndex9
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_MRO0_DevIndex9
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_11/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_11/Functions/DevType3_MRO1_DevIndexA
    [Tags]  system inventory    PCIe device     DevType3_MRO1_DevIndexA
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_MRO1_DevIndexA
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_11/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_11/Functions/DevType3_SAT2_DevIndexB
    [Tags]  system inventory    PCIe device     DevType3_SAT2_DevIndexB
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_SAT2_DevIndexB
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_11/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_14
    [Tags]  system inventory    PCIe device     00_00_14
    [Teardown]  close all browsers
    ${text}=   set variable   00_00_14
    open browser    ${URL}Chassis/Self/PCIeDevices/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_14/Functions/DevType3_TERM_DevIndexD
    [Tags]  system inventory    PCIe device     DevType3_TERM_DevIndexD
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_TERM_DevIndexD
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_14/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_14/Functions/DevType3_XHCI_DevIndexC
    [Tags]  system inventory    PCIe device     DevType3_XHCI_DevIndexC
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_XHCI_DevIndexC
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_14/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_16
    [Tags]  system inventory    PCIe device     00_00_16
    [Teardown]  close all browsers
    ${text}=   set variable   00_00_16
    open browser    ${URL}Chassis/Self/PCIeDevices/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_16/Functions/DevType3_HEC1_DevIndexE
    [Tags]  system inventory    PCIe device     DevType3_HEC1_DevIndexE
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_HEC1_DevIndexE
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_16/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_16/Functions/DevType3_HEC2_DevIndexF
    [Tags]  system inventory    PCIe device     DevType3_HEC2_DevIndexF
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_HEC2_DevIndexF
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_16/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_16/Functions/DevType3_HEC3_DevIndex10
    [Tags]  system inventory    PCIe device     DevType3_HEC3_DevIndex10
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_HEC3_DevIndex10
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_16/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_17
    [Tags]  system inventory    PCIe device     00_00_17
    [Teardown]  close all browsers
    ${text}=   set variable   00_00_17
    open browser    ${URL}Chassis/Self/PCIeDevices/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_17/Functions/DevType3_SAT1_DevIndex11
    [Tags]  system inventory    PCIe device     DevType3_SAT1_DevIndex11
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_SAT1_DevIndex11
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_17/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_1C
    [Tags]  system inventory    PCIe device     00_00_1C
    [Teardown]  close all browsers
    ${text}=   set variable   00_00_1C
    open browser    ${URL}Chassis/Self/PCIeDevices/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_1C/Functions/DevType3_RP01_DevIndex12
    [Tags]  system inventory    PCIe device     DevType3_RP01_DevIndex12
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_RP01_DevIndex12
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_1C/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_1C/Functions/DevType3_RP02_DevIndex15
    [Tags]  system inventory    PCIe device     DevType3_RP02_DevIndex15
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_RP02_DevIndex15
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_1C/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_1C/Functions/DevType3_RP05_DevIndex17
    [Tags]  system inventory    PCIe device     DevType3_RP05_DevIndex17
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_RP05_DevIndex17
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_1C/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_00_1C/Functions/DevType3_RP07_DevIndex18
    [Tags]  system inventory    PCIe device     DevType3_RP07_DevIndex18
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_RP07_DevIndex18
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_1C/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_01_1F
    [Tags]  system inventory    PCIe devcie     00_00_1F
    [Teardown]  close all browsers
    ${text}=   set variable   00_00_1F
    open browser    ${URL}Chassis/Self/PCIeDevices/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_01_1F/Functions/DevType3_LPC0_DevIndex19
    [Tags]  system inventory    PCIe devcie     DevType3_LPC0_DevIndex19
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_LPC0_DevIndex19
    open browser    ${URL}Chassis/Self/PCIeDevices/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_01_1F/Functions/DevType3_PMC1_DevIndex1A
    [Tags]  system inventory    PCIe devcie     DevType3_PMC1_DevIndex1A
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_PMC1_DevIndex1A
    open browser    ${URL}Chassis/Self/PCIeDevices/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_01_1F/Functions/DevType3_SMBS_DevIndex1B
    [Tags]  system inventory    PCIe devcie     DevType3_SMBS_DevIndex1B
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_SMBS_DevIndex1B
    open browser    ${URL}Chassis/Self/PCIeDevices/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_01_1F/Functions/DevType3_SPIC_DevIndex1C
    [Tags]  system inventory    PCIe devcie     DevType3_SPIC_DevIndex1C
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_SPIC_DevIndex1C
    open browser    ${URL}Chassis/Self/PCIeDevices/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_01_00
    [Tags]  system inventory    PCIe device     00_01_00
    [Teardown]  close all browsers
    ${text}=   set variable   00_01_00
    open browser    ${URL}Chassis/Self/PCIeDevices/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_01_00/Functions/DevType3_VB00_DevIndex13
    [Tags]  system inventory    PCIe device     DevType3_VB00_DevIndex13
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3_VB00_DevIndex13
    open browser    ${URL}Chassis/Self/PCIeDevices/00_01_00/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_02_00
    [Tags]  system inventory    PCIe device     00_02_00
    [Teardown]  close all browsers
    ${text}=   set variable   00_02_00
    open browser    ${URL}Chassis/Self/PCIeDevices/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_02_00/Functions/DevType3__DevIndex14
    [Tags]  system inventory    PCIe devcie     DevType3__DevIndex14
    [Teardown]  close all browsers
    ${text}=   set variable   DevType3__DevIndex14
    open browser    ${URL}Chassis/Self/PCIeDevices/00_02_00/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_03_00
    [Tags]  system inventory    PCIe device     00_03_00
    [Teardown]  close all browsers
    ${text}=   set variable   00_03_00
    open browser    ${URL}Chassis/Self/PCIeDevices/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}

Test PCIe device /00_03_00/Functions/DevType3_LAN1_DevIndex16
    [Tags]  system inventory    PCIe device     DevType3_LAN1_DevIndex16
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_LAN1_DevIndex16
    open browser    ${URL}Chassis/Self/PCIeDevices/00_03_00/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_17_00
    [Tags]  system inventory    PCIe device     00_17_00
    [Teardown]  close all browsers
    ${device}=   set variable   00_17_00
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_17_00/Functions/DevType3_BR1A_DevIndex1D
    [Tags]  system inventory    PCIe device     DevType3_BR1A_DevIndex1D
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_BR1A_DevIndex1D
    open browser    ${URL}Chassis/Self/PCIeDevices/00_17_00/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_17_01
    [Tags]  system inventory    PCIe device     00_17_01
    [Teardown]  close all browsers
    ${device}=   set variable   00_17_01
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_17_01/Functions/DevType3_BR1B_DevIndex1E
    [Tags]  system inventory    PCIe device     DevType3_BR1B_DevIndex1E
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_BR1B_DevIndex1E
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_17_02
    [Tags]  system inventory    PCIe device     00_17_02
    [Teardown]  close all browsers
    ${device}=   set variable   00_17_02
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_17_02/Functions/DevType3_BR1C_DevIndex1F
    [Tags]  system inventory    PCIe device     DevType3_BR1C_DevIndex1F
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_BR1C_DevIndex1F
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

#Test PCIe device /00_18_00
#    [Tags]  system inventory    00_18_00
#    [Teardown]  close all browsers
#    ${device}=   set variable   00_18_00
#    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
#    wait until element contains     //*[@id="/Id"]      ${device}
#    ${text}=    get text    //*[@id="/Id"]
#    should match  ${text}    Id "${device}"

#Test PCIe device /00_18_00/Functions/DevType3_OCL0_DevIndex1E
#    [Tags]  system inventory    DevType3_OCL0_DevIndex1E
#    [Teardown]  close all browsers
#    ${device}=   set variable   DevType3_OCL0_DevIndex1E
#    open browser    ${URL}Chassis/Self/PCIeDevices/00_18_00/Functions/${device}  ff
#    wait until element contains     //*[@id="/Id"]      ${device}
#    ${text}=    get text    //*[@id="/Id"]
#    should match  ${text}    Id "${device}"

#Test PCIe device /00_19_00
#    [Tags]  system inventory    00_19_00
#    [Teardown]  close all browsers
#    ${device}=   set variable   00_19_00
#    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
#    wait until element contains     //*[@id="/Id"]      ${device}
#    ${text}=    get text    //*[@id="/Id"]
#    should match  ${text}    Id "${device}"

#Test PCIe device /00_19_00/Functions/DevType3_DMMY_DevIndex1F
#    [Tags]  system inventory    DevType3_DMMY_DevIndex1F
#    [Teardown]  close all browsers
#    ${device}=   set variable   DevType3_DMMY_DevIndex1F
#    open browser    ${URL}Chassis/Self/PCIeDevices/00_19_00/Functions/${device}  ff
#    wait until element contains     //*[@id="/Id"]      ${device}
#    ${text}=    get text    //*[@id="/Id"]
#    should match  ${text}    Id "${device}"

#Test PCIe device /00_1A_00
#    [Tags]  system inventory    00_1A_00
#    [Teardown]  close all browsers
#    ${device}=   set variable   00_1A_00
#    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
#    wait until element contains     //*[@id="/Id"]      ${device}
#    ${text}=    get text    //*[@id="/Id"]
#    should match  ${text}    Id "${device}"

#Test PCIe device /00_1A_00/Functions/DevType3_DMMY_DevIndex20
#    [Tags]  system inventory    DevType3_DMMY_DevIndex20
#    [Teardown]  close all browsers
#    ${device}=   set variable   DevType3_DMMY_DevIndex20
#    open browser    ${URL}Chassis/Self/PCIeDevices/00_1A_00/Functions/${device}  ff
#    wait until element contains     //*[@id="/Id"]      ${device}
#    ${text}=    get text    //*[@id="/Id"]
#    should match  ${text}    Id "${device}"

#Test PCIe device /00_19_01
#    [Tags]  system inventory    00_19_01
#    [Teardown]  close all browsers
#    ${device}=   set variable   00_19_01
#    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
#    wait until element contains     //*[@id="/Id"]      ${device}
#    ${text}=    get text    //*[@id="/Id"]
#    should match  ${text}    Id "${device}"

#Test PCIe device /00_19_01/Functions/DevType3_DMMY_DevIndex21
#    [Tags]  system inventory    DevType3_DMMY_DevIndex21
#    [Teardown]  close all browsers
#    ${device}=   set variable   DevType3_DMMY_DevIndex21
#    open browser    ${URL}Chassis/Self/PCIeDevices/00_19_01/Functions/${device}  ff
#    wait until element contains     //*[@id="/Id"]      ${device}
#    ${text}=    get text    //*[@id="/Id"]
#    should match  ${text}    Id "${device}"

#Test PCIe device /00_1B_00
#    [Tags]  system inventory    00_1B_00
#    [Teardown]  close all browsers
#    ${device}=   set variable   00_1B_00
#    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
#    wait until element contains     //*[@id="/Id"]      ${device}
#    ${text}=    get text    //*[@id="/Id"]
#    should match  ${text}    Id "${device}"

#Test PCIe device /00_1B_00/Functions/DevType3_DMMY_DevIndex22
#    [Tags]  system inventory    DevType3_DMMY_DevIndex22
#    [Teardown]  close all browsers
#    ${device}=   set variable   DevType3_DMMY_DevIndex22
#    open browser    ${URL}Chassis/Self/PCIeDevices/00_1B_00/Functions/${device}  ff
#    wait until element contains     //*[@id="/Id"]      ${device}
#    ${text}=    get text    //*[@id="/Id"]
#    should match  ${text}    Id "${device}"

#Test PCIe device /00_19_02
#    [Tags]  system inventory    00_19_02
#    [Teardown]  close all browsers
#    ${device}=   set variable   00_19_02
#    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
#    wait until element contains     //*[@id="/Id"]      ${device}
#    ${text}=    get text    //*[@id="/Id"]
#    should match  ${text}    Id "${device}"

#Test PCIe device /00_19_02/Functions/DevType3_DMMY_DevIndex23
#    [Tags]  system inventory    DevType3_DMMY_DevIndex23
#    [Teardown]  close all browsers
#    ${device}=   set variable   DevType3_DMMY_DevIndex23
#    open browser    ${URL}Chassis/Self/PCIeDevices/00_19_02/Functions/${device}  ff
#    wait until element contains     //*[@id="/Id"]      ${device}
#    ${text}=    get text    //*[@id="/Id"]
#    should match  ${text}    Id "${device}"

#Test PCIe device /00_1C_00
#    [Tags]  system inventory    00_1C_00
#    [Teardown]  close all browsers
#    ${device}=   set variable   00_1C_00
#    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
#    wait until element contains     //*[@id="/Id"]      ${device}
#    ${text}=    get text    //*[@id="/Id"]
#    should match  ${text}    Id "${device}"

#Test PCIe device /00_1C_00/Functions/DevType3_DMMY_DevIndex24
#    [Tags]  system inventory    DevType3_DMMY_DevIndex24
#    [Teardown]  close all browsers
#    ${device}=   set variable   DevType3_DMMY_DevIndex24
#    open browser    ${URL}Chassis/Self/PCIeDevices/00_1C_00/Functions/${device}  ff
#    wait until element contains     //*[@id="/Id"]      ${device}
#    ${text}=    get text    //*[@id="/Id"]
#    should match  ${text}    Id "${device}"

Test PCIe device /00_3A_00
    [Tags]  system inventory    PCIe device     00_3A_00
    [Teardown]  close all browsers
    ${device}=   set variable   00_3A_00
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_3A_00/Functions/DevType3_BR2A_DevIndex20
    [Tags]  system inventory    DevType3_BR2A_DevIndex20
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_BR2A_DevIndex20
    open browser    ${URL}Chassis/Self/PCIeDevices/00_3A_00/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_3B_00
    [Tags]  system inventory    PCIe device     00_3B_00
    [Teardown]  close all browsers
    ${device}=   set variable   00_3B_00
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_3B_00/Functions/DevType3_DMMY_DevIndex22
    [Tags]  system inventory    PCIe device     DevType3_DMMY_DevIndex22
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_DMMY_DevIndex22
    open browser    ${URL}Chassis/Self/PCIeDevices/00_3B_00/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_3B_00/Functions/DevType3_EPCU_DevIndex21
    [Tags]  system inventory    PCIe device     DevType3_EPCU_DevIndex21
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_EPCU_DevIndex21
    open browser    ${URL}Chassis/Self/PCIeDevices/00_3B_00/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_5D_00
    [Tags]  system inventory    PCIe device     00_5D_00
    [Teardown]  close all browsers
    ${device}=   set variable   00_5D_00
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_5D_00/Functions/DevType3_BR3A_DevIndex23
    [Tags]  system inventory    PCIe devcie     DevType3_BR3A_DevIndex23
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_BR3A_DevIndex23
    open browser    ${URL}Chassis/Self/PCIeDevices/00_5D_00/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_5D_0E
    [Tags]  system inventory    PCIe device     00_5D_0E
    [Teardown]  close all browsers
    ${device}=   set variable   00_5D_0E
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_5D_0E/Functions/DevType3_KTI0_DevIndex24
    [Tags]  system inventory    PCIe device     DevType3_KTI0_DevIndex24
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_KTI0_DevIndex24
    open browser    ${URL}Chassis/Self/PCIeDevices/00_5D_0E/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_5D_0F
    [Tags]  system inventory    PCIe device     00_5D_0F
    [Teardown]  close all browsers
    ${device}=   set variable   00_5D_0F
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_5D_0F/Functions/DevType3_KIT1_DevIndex25
    [Tags]  system inventory    PCIe device     DevType3_KIT1_DevIndex25
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_KIT1_DevIndex25
    open browser    ${URL}Chassis/Self/PCIeDevices/00_5D_0F/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_5D_10
    [Tags]  system inventory    PCIe devcie     00_5D_10
    [Teardown]  close all browsers
    ${device}=   set variable   00_5D_10
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_5D_10/Functions/DevType3_KIT2_DevIndex26
    [Tags]  system inventory    PCIe device     DevType3_KIT2_DevIndex26
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_KIT2_DevIndex26
    open browser    ${URL}Chassis/Self/PCIeDevices/00_5D_10/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_5D_12
    [Tags]  system inventory    PCIe device     00_5D_12
    [Teardown]  close all browsers
    ${device}=   set variable   00_5D_12
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_5D_12/Functions/DevType3_DMMY_DevIndex28
    [Tags]  system inventory    PCIe devcie     DevType3_DMMY_DevIndex28
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_DMMY_DevIndex28
    open browser    ${URL}Chassis/Self/PCIeDevices/00_5D_12/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_5D_12/Functions/DevType3_DMMY_DevIndex29
    [Tags]  system inventory    PCIe device     DevType3_DMMY_DevIndex29
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_DMMY_DevIndex29
    open browser    ${URL}Chassis/Self/PCIeDevices/00_5D_12/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_5D_12/Functions/DevType3_DMMY_DevIndex2A
    [Tags]  system inventory    PCIe device     DevType3_DMMY_DevIndex2A
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_DMMY_DevIndex2A
    open browser    ${URL}Chassis/Self/PCIeDevices/00_5D_12/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_5D_12/Functions/DevType3_M3K0_DevIndex27
    [Tags]  system inventory    PCIe device     DevType3_M3K0_DevIndex27
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_M3K0_DevIndex27
    open browser    ${URL}Chassis/Self/PCIeDevices/00_5D_12/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_5D_15
    [Tags]  system inventory    PCIe device     00_5D_15
    [Teardown]  close all browsers
    ${device}=   set variable   00_5D_15
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_5D_15/Functions/DevType3_DMMY_DevIndex2B
    [Tags]  system inventory    PCIe devcie     DevType3_DMMY_DevIndex2B
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_DMMY_DevIndex2B
    open browser    ${URL}Chassis/Self/PCIeDevices/00_5D_15/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_5D_16
    [Tags]  system inventory    PCIe device     00_5D_16
    [Teardown]  close all browsers
    ${device}=   set variable   00_5D_16
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_5D_16/Functions/DevType3_DMMY_DevIndex2C
    [Tags]  system inventory    PCIe devcie     DevType3_DMMY_DevIndex2C
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_DMMY_DevIndex2C
    open browser    ${URL}Chassis/Self/PCIeDevices/00_5D_16/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_5D_16/Functions/DevType3_DMMY_DevIndex2D
    [Tags]  system inventory    PCIe devcie     DevType3_DMMY_DevIndex2D
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_DMMY_DevIndex2D
    open browser    ${URL}Chassis/Self/PCIeDevices/00_5D_16/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_5D_17
    [Tags]  system inventory    PCIe device     00_5D_17
    [Teardown]  close all browsers
    ${device}=   set variable   00_5D_17
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_5D_17/Functions/DevType3_DMMY_DevIndex2E
    [Tags]  system inventory    PCIe devcie     DevType3_DMMY_DevIndex2E
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_DMMY_DevIndex2E
    open browser    ${URL}Chassis/Self/PCIeDevices/00_5D_17/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_80_00
    [Tags]  system inventory    PCIe devcie     00_80_00
    [Teardown]  close all browsers
    ${device}=   set variable   00_80_00
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_80_00/Functions/DevType3_QRP0_DevIndex2F
    [Tags]  system inventory    PCIe device     DevType3_QRP0_DevIndex2F
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_QRP0_DevIndex2F
    open browser    ${URL}Chassis/Self/PCIeDevices/00_80_00/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_80_08
    [Tags]  system inventory    PCIe device     00_80_08
    [Teardown]  close all browsers
    ${device}=   set variable   00_80_08
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_80_08/Functions/DevType3_DMMY_DevIndex30
    [Tags]  system inventory    PCIe device     DevType3_DMMY_DevIndex30
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_DMMY_DevIndex30
    open browser    ${URL}Chassis/Self/PCIeDevices/00_80_08/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_85_00
    [Tags]  system inventory    PCIe device     00_85_00
    [Teardown]  close all browsers
    ${device}=   set variable   00_85_00
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_85_00/Functions/DevType3_QR1A_DevIndex31
    [Tags]  system inventory    PCIe device     DevType3_QR1A_DevIndex31
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_QR1A_DevIndex31
    open browser    ${URL}Chassis/Self/PCIeDevices/00_85_00/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_85_02
    [Tags]  system inventory    PCIe device     00_85_02
    [Teardown]  close all browsers
    ${device}=   set variable   00_85_02
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_85_02/Functions/DevType3_QR1C_DevIndex32
    [Tags]  system inventory    PCIe device     DevType3_QR1C_DevIndex32
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_QR1C_DevIndex32
    open browser    ${URL}Chassis/Self/PCIeDevices/00_85_02/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_AE_00
    [Tags]  system inventory    PCIe device     00_AE_00
    [Teardown]  close all browsers
    ${device}=   set variable   00_AE_00
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_AE_00/Functions/DevType3_QR2A_DevIndex33
    [Tags]  system inventory    PCIe device     DevType3_QR2A_DevIndex33
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_QR2A_DevIndex33
    open browser    ${URL}Chassis/Self/PCIeDevices/00_AE_00/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_D7_00
    [Tags]  system inventory    PCIe device     00_D7_00
    [Teardown]  close all browsers
    ${device}=   set variable   00_D7_00
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_D7_00/Functions/DevType3_QR3A_DevIndex34
    [Tags]  system inventory    PCIe device     DevType3_QR3A_DevIndex34
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_KIT3_DevIndex34
    open browser    ${URL}Chassis/Self/PCIeDevices/00_D7_00/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_D7_0E
    [Tags]  system inventory    PCIe device     00_D7_0E
    [Teardown]  close all browsers
    ${device}=   set variable   00_D7_0E
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_D7_0E/Functions/DevType3_KIT3_DevIndex35
    [Tags]  system inventory    PCIe device     DevType3_KIT3_DevIndex35
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_KIT3_DevIndex35
    open browser    ${URL}Chassis/Self/PCIeDevices/00_D7_0E/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_D7_0F
    [Tags]  system inventory    PCIe devcie     00_D7_0F
    [Teardown]  close all browsers
    ${device}=   set variable   00_D7_0F
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_D7_0F/Functions/DevType3_KIT4_DevIndex36
    [Tags]  system inventory    PCIe device     DevType3_KIT4_DevIndex36
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_KIT4_DevIndex36
    open browser    ${URL}Chassis/Self/PCIeDevices/00_D7_0F/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_D7_10
    [Tags]  system inventory    PCIe device     00_D7_10
    [Teardown]  close all browsers
    ${device}=   set variable   00_D7_10
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_D7_10/Functions/DevType3_KIT5_DevIndex37
    [Tags]  system inventory    PCIe device     DevType3_KIT5_DevIndex37
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_KIT5_DevIndex37
    open browser    ${URL}Chassis/Self/PCIeDevices/00_D7_10/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_D7_12
    [Tags]  system inventory    PCIe device     00_D7_12
    [Teardown]  close all browsers
    ${device}=   set variable   00_D7_12
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_D7_12/Functions/DevType3_DMMY_DevIndex39
    [Tags]  system inventory    PCIe device     DevType3_DMMY_DevIndex39
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_DMMY_DevIndex39
    open browser    ${URL}Chassis/Self/PCIeDevices/00_D7_12/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_D7_12/Functions/DevType3_DMMY_DevIndex3A
    [Tags]  system inventory    PCIe device     DevType3_DMMY_DevIndex3A
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_DMMY_DevIndex3A
    open browser    ${URL}Chassis/Self/PCIeDevices/00_D7_12/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_D7_12/Functions/DevType3_DMMY_DevIndex3B
    [Tags]  system inventory    PCIe device     DevType3_DMMY_DevIndex3B
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_DMMY_DevIndex3B
    open browser    ${URL}Chassis/Self/PCIeDevices/00_D7_12/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_D7_12/Functions/DevType3_M3K1_DevIndex38
    [Tags]  system inventory    PCIe devcie     DevType3_M3K1_DevIndex38
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_M3K1_DevIndex38
    open browser    ${URL}Chassis/Self/PCIeDevices/00_D7_12/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_D7_15
    [Tags]  system inventory    PCIe device     00_D7_15
    [Teardown]  close all browsers
    ${device}=   set variable   00_D7_15
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_D7_15/Functions/DevType3_DMMY_DevIndex3C
    [Tags]  system inventory    PCIe device     DevType3_DMMY_DevIndex3C
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_DMMY_DevIndex3C
    open browser    ${URL}Chassis/Self/PCIeDevices/00_D7_15/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_D7_16
    [Tags]  system inventory    PCIe device     00_D7_16
    [Teardown]  close all browsers
    ${device}=   set variable   00_D7_16
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_D7_16/Functions/DevType3_DMMY_DevIndex3D
    [Tags]  system inventory    PCIe device     DevType3_DMMY_DevIndex3D
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_DMMY_DevIndex3D
    open browser    ${URL}Chassis/Self/PCIeDevices/00_D7_16/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_D7_16/Functions/DevType3_DMMY_DevIndex3E
    [Tags]  system inventory    PCIe device     DevType3_DMMY_DevIndex3E
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_DMMY_DevIndex3E
    open browser    ${URL}Chassis/Self/PCIeDevices/00_D7_16/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_D7_17
    [Tags]  system inventory  PCIe device       00_D7_17
    [Teardown]  close all browsers
    ${device}=   set variable   00_D7_17
    open browser    ${URL}Chassis/Self/PCIeDevices/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test PCIe device /00_D7_17/Functions/DevType3_DMMY_DevIndex3F
    [Tags]  system inventory  PCIe device       DevType3_DMMY_DevIndex3F
    [Teardown]  close all browsers
    ${device}=   set variable   DevType3_DMMY_DevIndex3F
    open browser    ${URL}Chassis/Self/PCIeDevices/00_D7_17/Functions/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}

Test registries /Registries/NDCS18OR.1.0.0
    [Tags]  registry  BIOS  NDCS18
    [Teardown]  close all browsers
    ${device}=   set variable   NDCS18OR.1.0.0
    open browser    ${URL}Registries/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}
    ${text}=    get text    //*[@id="/Id"]
    should match  ${text}    Id "${device}"

Test BIOS attribute registry
    [Tags]  registry  BIOS  BiosAttributeRegistry
    [Teardown]  close all browsers
    ${device}=   set variable   BiosAttributeRegistry33101.4.8.1
    open browser    ${URL}Registries/${device}  ff
    wait until element contains     //*[@id="/Id"]      ${device}
    ${text}=    get text    //*[@id="/Id"]
    should match  ${text}    Id "${device}"


# *** Test Task ***


*** Keywords ***
Custome Teardown
    close all browsers

Login SSH
    open connection     ${host_addr}    prompt=$
    ${std_output}=   login  ${host_username}    ${host_password}
    should contain  ${std_output}   $

ID verification
    open browser    ${URL}Chassis/Self/PCIeDevices/00_00_16/Functions/${text}  ff
    wait until element contains     //*[@id="/Id"]      ${text}


*** Comment ***
Note:
1. If the value of a keyword, should match, is a string, it shall put the sting in quotation marks (""). 
... If the value is a boolin (ture/false) or numbers, it should not put in quotation marks.