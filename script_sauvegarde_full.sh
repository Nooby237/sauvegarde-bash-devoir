#!/bin/bash

# Variables
SOURCE="/home/r1ck/Simulated_S1/R1"
DESTINATION="/home/r1ck/Simulated_S2/R2/sauvegardes_completes/backup_complet_$(date +%Y-%m-%d)"
LOGFILE="/home/r1ck/logs/sauvegarde_full.log"

# Commande de sauvegarde complète
echo "Début de la sauvegarde complète : $(date)" >> "$LOGFILE"
rsync -avz --delete "$SOURCE" "$DESTINATION" >> "$LOGFILE" 2>&1

if [ $? -eq 0 ]; then
    echo "Sauvegarde complète terminée avec succès : $(date)" >> "$LOGFILE"
else
    echo "Erreur lors de la sauvegarde complète : $(date)" >> "$LOGFILE"
fi
