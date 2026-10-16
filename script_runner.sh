echo "Validating Spec ... "
sh gradlew validateSpec  --warning-mode all --stacktrace

echo "Generating open api spec .. "
sh gradlew generateSpec  --warning-mode all --stacktrace

echo "Generating SPI Jar .. "
sh gradlew build
