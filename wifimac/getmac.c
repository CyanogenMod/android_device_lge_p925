/*
 * Copyright (C) 2011 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

/* Read device NVRAM and set the Wifi MAC address accordingly */

static int macmap[6][2] = { { 2, 11 }, { 3, 10 }, { 4, 6 }, { 5, 5 }, 
	   			{ 6, 4 }, { 7, 3 }};

int main() {
	int fd1, fd2;
	int macbyte;
	int i;

	fd1 = open("/dev/block/mmcblk0p3",O_RDONLY);
	fd2 = open("/data/misc/wifi/nvs_map.bin",O_WRONLY);

	for (i = 0; i<6; i++) {
		lseek(fd1,macmap[i][0],SEEK_SET);
		lseek(fd2,macmap[i][1],SEEK_SET);
		read(fd1,&macbyte,1);
		write(fd2,&macbyte,1);
	}

	close(fd1);
	close(fd2);
	return 0;
}
