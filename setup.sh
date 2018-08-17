echo "----------------------------------------";
echo "⬇️  Updating gem";
echo "----------------------------------------";

sudo gem update --system

echo "----------------------------------------";
echo "⬇️  Installing brew";
echo "----------------------------------------";

/usr/bin/ruby \
-e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" \
< /dev/null

echo "----------------------------------------";
echo "⬇️  Installing SwiftLint";
echo "----------------------------------------";

brew install swiftlint

echo "----------------------------------------";
echo "⬇️  Installing Fastlane";
echo "----------------------------------------";

xcode-select --install
sudo gem install fastlane -n /usr/local/bin

echo "----------------------------------------";
echo "⬇️  Installing Fastlane Plugins";
echo "----------------------------------------";

bundle exec fastlane add_plugin changelog

echo "----------------------------------------";
echo "⬇️  Installing Cocoapods";
echo "----------------------------------------";

sudo gem install cocoapods -n /usr/local/bin