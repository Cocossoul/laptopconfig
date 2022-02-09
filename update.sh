if test -f /tmp/coco_update_prompt; then
	exit 0;
fi

touch /tmp/coco_update_prompt

echo -n "Hello Sir, do you have time to update your system? (y/n)"
read answer

if [ "${answer}" != "${answer#[Yy]}" ]; then
	sudo pacman -Syyu
else
	echo "Maybe next time"
fi

