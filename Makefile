analyze:
	dart analyze

format:
	dart format --line-length 120 ./lib

checkTests:
	flutter test

updateGoldens:
	flutter test --update-goldens

checkFormat:
	dart format --line-length 120 -o none --set-exit-if-changed ./lib

sure: 
	make checkTests && make analyze

buildRunner:
	flutter packages pub run build_runner build --delete-conflicting-outputs