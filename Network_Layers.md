# NETWORK LAYERS

The layers in networking are typically described using the OSI (Open Systems Interconnection) model, which defines seven layers. Let's go through each of them:

## Physical Layer (Layer 1):

Deals with the physical connection between devices
Defines specifications for cables, connectors, voltages, etc.
Transmits raw bit streams over a physical medium


## Data Link Layer (Layer 2):

Provides node-to-node data transfer
Detects and possibly corrects errors from the physical layer
Defines how data is formatted for transmission
Uses MAC addresses for addressing
Example protocols: Ethernet, Wi-Fi


## Network Layer (Layer 3):

Handles routing and forwarding of data packets
Provides logical addressing (e.g., IP addresses)
Manages traffic control and packet sequencing
Example protocol: IP (Internet Protocol)


## Transport Layer (Layer 4):

Provides end-to-end communication control
Ensures reliable data transfer
Handles flow control and error recovery
Example protocols: TCP (connection-oriented), UDP (connectionless)


## Session Layer (Layer 5):

Establishes, manages, and terminates sessions between applications
Handles authentication and authorization
Example protocols: NetBIOS, RPC


## Presentation Layer (Layer 6):

Translates data between the application layer and the network format
Handles data compression, encryption, and formatting
Example standards: JPEG, MPEG, SSL/TLS


## Application Layer (Layer 7):

Provides network services directly to end-users or applications
Defines protocols that applications use to exchange data
Example protocols: HTTP, FTP, SMTP, DNS


## It's worth noting that while the OSI model is comprehensive, 

in practice, many networks use the simplified TCP/IP model, which combines some of these layers:

### Link Layer (combines OSI Physical and Data Link layers)
### Internet Layer (equivalent to OSI Network layer)
### Transport Layer (equivalent to OSI Transport layer)
### Application Layer (combines OSI Session, Presentation, and Application layers)

Understanding these layers helps in troubleshooting network issues and in designing network architectures, as each layer has specific responsibilities and protocols associated with it.