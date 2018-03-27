#!/bin/bash
#source /afs/cern.ch/user/o/olantwin/SHiP_Software/setup.sh
source /afs/cern.ch/user/a/algrandc/FairShipRun/config.sh
set -ux
echo "Starting script."
#DIR=$1
#ProcId=$2
#LSB_JOBINDEX=$((ProcId+1))
MUONS=/eos/experiment/ship/data/Mbias/pythia8_Geant4-withCharm_onlyMuons_4magTarget.root
#NTOTAL=17786274
#NJOBS=$3
#TANK=6
#ISHIP=3
#MUSHIELD=9
#N=$(( NTOTAL/NJOBS + ( LSB_JOBINDEX == NJOBS ? NTOTAL % NJOBS : 0 ) ))
N=5000
#FIRST=$(((NTOTAL/NJOBS)*(LSB_JOBINDEX-1)))

#python2 "$FAIRSHIPRUN"/macro/run_simScript.py --tankDesign $TANK --muShieldDesign $MUSHIELD --MuonBack --nEvents $N --firstEvent $FIRST --sameSeed 1 --seed 1 -f $MUONS --nuTauTargetDesign $ISHIP
python2 "$FAIRSHIP"/macro/run_simScript.py --MuonBack --nEvents $N  -f $MUONS
xrdcp ship.conical.MuonBack-TGeant4.root /eos/user/a/algrandc/EmShield/sim/ship.conical.MuonBack.both.-TGeant4.root
#if [ "$LSB_JOBINDEX" -eq 1 ]; then
xrdcp geofile_full.conical.MuonBack-TGeant4.root /eos/user/a/algrandc/EmShield/geo/geofile_full.conical.MuonBack.both.-TGeant4.root     

#fi

