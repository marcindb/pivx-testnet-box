PIVXD=pivxd
PIVXGUI=pivx-qt
PIVXCLI=pivx-cli
P1_FLAGS=
P2_FLAGS=
P1=-datadir=1 $(P1_FLAGS)
P2=-datadir=2 $(P2_FLAGS)
BLOCKS=1
ADDRESS=
AMOUNT=
ACCOUNT=

start:
	$(PIVXD) $(P1) -daemon
	$(PIVXD) $(P2) -daemon

start-gui:
	$(PIVXGUI) $(P1) &
	$(PIVXGUI) $(P2) &

generate:
	$(PIVXCLI) $(P1) generate 100

getinfo:
	$(PIVXCLI) $(P1) getblockchaininfo
	$(PIVXCLI) $(P2) getblockchaininfo

sendfrom1:
	$(PIVXCLI) $(P1) sendtoaddress $(ADDRESS) $(AMOUNT)

sendfrom2:
	$(PIVXCLI) $(P2) sendtoaddress $(ADDRESS) $(AMOUNT)

address1:
	$(PIVXCLI) $(P1) getnewaddress $(ACCOUNT)

address2:
	$(PIVXCLI) $(P2) getnewaddress $(ACCOUNT)

stop:
	$(PIVXCLI) $(P1) stop
	$(PIVXCLI) $(P2) stop

clean:
	find 1/regtest/* -not -name 'server.*' -delete
	find 2/regtest/* -not -name 'server.*' -delete
