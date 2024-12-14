#!/bin/bash

# Variables
SOURCE="/home/r1ck/Simulated_S1/R1"
DESTINATION="/home/r1ck/Simulated_S2/R2/sauvegardes_diff/backup_diff_$(date +%Y-%m-%d)"
LAST_FULL_BACKUP="/home/r1ck/Simulated_S2/R2/sauvegardes_completes/backup_complet_dernier"
LOGFILE="/home/r1ck/logs/sauvegarde_diff.log"

# Commande de sauvegarde différentielle
echo "Début de la sauvegarde différentielle : $(date)" >> "$LOGFILE"
rsync -avz --link-dest="$LAST_FULL_BACKUP" "$SOURCE" "$DESTINATION" >> "$LOGFILE" 2>&1

if [ $? -eq 0 ]; then
    echo "Sauvegarde différentielle terminée avec succès : $(date)" >> "$LOGFILE"
else
    echo "Erreur lors de la sauvegarde différentielle : $(date)" >> "$LOGFILE"
fi
