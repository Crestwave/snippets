#!/bin/sh
pause() {
	printf 'Press any key to continue...\n'
	stty raw -echo
	dd bs=1 count=1 2>/dev/null >&2
	stty -raw echo
}

clear
echo NSMASR ISO Builder
echo Builder by damysteryman, edited by CLF78
echo Powered by WIT by Wiimm
pause

echo ''
echo Checking resources...

if ! [ -d NSMASDemo ]; then
	echo ''
	echo Cannot find the folder containing the mod files.
	echo ''
	echo Please make sure you have it in the same directory
	echo as this script. Exiting...
	echo ''
	pause
	exit 1
else
	echo ''
fi

basever=UNK

if ! [ -d nsmb.d ]; then
	echo Unpacking original game...
	wit extract -s ./ -1 -n SMN.01 . nsmb.d --psel=DATA -ovv
fi
echo ''
if [ -f nsmb.d/files/COPYDATE_LAST_2009-10-03_232911 ]; then
	basever=EURv1
	gameid=SMNP01
	echo Detected version: PAL v1
fi
if [ -f nsmb.d/files/COPYDATE_LAST_2010-01-05_152101 ]; then
	basever=EURv2
	gameid=SMNP01
	echo Detected version: PAL v2
fi
if [ -f nsmb.d/files/COPYDATE_LAST_2009-10-03_232303 ]; then
	basever=USAv1
	gameid=SMNE01
	echo Detected version: NTSC-U v1
fi
if [ -f nsmb.d/files/COPYDATE_LAST_2010-01-05_143554 ]; then
	basever=USAv2
	gameid=SMNE01
	echo Detected version: NTSC-U v2
fi
if [ -f nsmb.d/files/COPYDATE_LAST_2009-10-03_231655 ]; then
	basever=JPNv1
	gameid=SMNJ01
	echo Detected version: NTSC-J v1
fi
if [ -f nsmb.d/files/COPYDATE_LAST_2010-01-05_160530 ]; then
	basever=JPNv2
	gameid=SMNJ01
	echo Detected version: NTSC-J v2
fi
if [ "$basever" = UNK ]; then
	echo Game version not supported, exiting...
	rm -rf nsmb.d
	exit 1
fi

echo ''
echo Deleting unused files...

rm -f nsmb.d/files/Effect/effect_wnmario_demo.breff
rm -f nsmb.d/files/Effect/effect_wnmario_demo.breft
rm -f nsmb.d/files/Effect/effect_wnmario_iggy.breff
rm -f nsmb.d/files/Effect/effect_wnmario_iggy.breft
rm -f nsmb.d/files/Effect/effect_wnmario_jr.breff
rm -f nsmb.d/files/Effect/effect_wnmario_jr.breft
rm -f nsmb.d/files/Effect/effect_wnmario_kameck.breff
rm -f nsmb.d/files/Effect/effect_wnmario_kameck.breft
rm -f nsmb.d/files/Effect/effect_wnmario_larry.breff
rm -f nsmb.d/files/Effect/effect_wnmario_larry.breft
rm -f nsmb.d/files/Effect/effect_wnmario_lemmy.breff
rm -f nsmb.d/files/Effect/effect_wnmario_lemmy.breft
rm -f nsmb.d/files/Effect/effect_wnmario_ludwig.breff
rm -f nsmb.d/files/Effect/effect_wnmario_ludwig.breft
rm -f nsmb.d/files/Effect/effect_wnmario_morton.breff
rm -f nsmb.d/files/Effect/effect_wnmario_morton.breft
rm -f nsmb.d/files/Effect/effect_wnmario_roy.breff
rm -f nsmb.d/files/Effect/effect_wnmario_roy.breft
rm -f nsmb.d/files/Effect/effect_wnmario_wendy.breff
rm -f nsmb.d/files/Effect/effect_wnmario_wendy.breft

rm -f nsmb.d/files/Env/Env_movie.arc

rm -rf nsmb.d/files/Layout/corseSelectUIGuide
rm -rf nsmb.d/files/Layout/cursor
rm -rf nsmb.d/files/Layout/demoMessage
rm -rf nsmb.d/files/Layout/draw
rm -rf nsmb.d/files/Layout/letterWindow
rm -rf nsmb.d/files/Layout/MultiCourseSelect
rm -rf nsmb.d/files/Layout/MultiCourseSelectContents
rm -f nsmb.d/files/Layout/textures/MultiCorseSelectTexture.arc
rm -rf nsmb.d/files/Layout/openingTitle
rm -rf nsmb.d/files/Layout/pointResult
rm -rf nsmb.d/files/Layout/pointResult_1P
rm -rf nsmb.d/files/Layout/pointResultBase
rm -rf nsmb.d/files/Layout/pointResultDateFile
rm -rf nsmb.d/files/Layout/pointResultDateFileFree
rm -rf nsmb.d/files/Layout/pointResultMulti
rm -rf nsmb.d/files/Layout/timeUp
rm -rf nsmb.d/files/Layout/worldCollectionCoin
rm -rf nsmb.d/files/Layout/worldCollectionCoinBase
rm -rf nsmb.d/files/Layout/worldCollectionCoinDate
rm -rf nsmb.d/files/Layout/worldSelectMap
rm -rf nsmb.d/files/Layout/worldSelectMapGuide

rm -rf nsmb.d/files/MovieDemo/

rm -f nsmb.d/files/Object/arrow.arc
rm -f nsmb.d/files/Object/ankou.arc
rm -f nsmb.d/files/Object/backWall.arc
rm -f nsmb.d/files/Object/bakubaku.arc
rm -f nsmb.d/files/Object/basabasa.arc
rm -f nsmb.d/files/Object/ben.arc
rm -f nsmb.d/files/Object/bgA_0001.arc
rm -f nsmb.d/files/Object/bgA_0102.arc
rm -f nsmb.d/files/Object/bgA_0202.arc
rm -f nsmb.d/files/Object/bgA_0402.arc
rm -f nsmb.d/files/Object/bgA_0602.arc
rm -f nsmb.d/files/Object/bgA_0802.arc
rm -f nsmb.d/files/Object/bgA_0902.arc
rm -f nsmb.d/files/Object/bgA_0A02.arc
rm -f nsmb.d/files/Object/bgA_0C02.arc
rm -f nsmb.d/files/Object/bgA_0D02.arc
rm -f nsmb.d/files/Object/bgA_0E02.arc
rm -f nsmb.d/files/Object/bgA_0F02.arc
rm -f nsmb.d/files/Object/bgA_1002.arc
rm -f nsmb.d/files/Object/bgA_2202.arc
rm -f nsmb.d/files/Object/bgA_2302.arc
rm -f nsmb.d/files/Object/bgA_2402.arc
rm -f nsmb.d/files/Object/bgA_2502.arc
rm -f nsmb.d/files/Object/bgA_2602.arc
rm -f nsmb.d/files/Object/bgA_2702.arc
rm -f nsmb.d/files/Object/bgA_2802.arc
rm -f nsmb.d/files/Object/bgA_2902.arc
rm -f nsmb.d/files/Object/bgA_2A02.arc
rm -f nsmb.d/files/Object/bgA_3102.arc
rm -f nsmb.d/files/Object/bgA_3302.arc
rm -f nsmb.d/files/Object/bgA_3402.arc
rm -f nsmb.d/files/Object/bgA_3B02.arc
rm -f nsmb.d/files/Object/bgA_3C02.arc
rm -f nsmb.d/files/Object/bgA_3D02.arc
rm -f nsmb.d/files/Object/bgA_3E02.arc
rm -f nsmb.d/files/Object/bgA_3F02.arc
rm -f nsmb.d/files/Object/bgA_4102.arc
rm -f nsmb.d/files/Object/bgA_4202.arc
rm -f nsmb.d/files/Object/bgA_4302.arc
rm -f nsmb.d/files/Object/bgA_4402.arc
rm -f nsmb.d/files/Object/bgA_4502.arc
rm -f nsmb.d/files/Object/bgA_4D02.arc
rm -f nsmb.d/files/Object/bgA_4F02.arc
rm -f nsmb.d/files/Object/bgA_5002.arc
rm -f nsmb.d/files/Object/bgA_5102.arc
rm -f nsmb.d/files/Object/bgA_5202.arc
rm -f nsmb.d/files/Object/bgA_5302.arc
rm -f nsmb.d/files/Object/bgA_5402.arc
rm -f nsmb.d/files/Object/bgA_5502.arc
rm -f nsmb.d/files/Object/bgA_5602.arc
rm -f nsmb.d/files/Object/bgA_5702.arc
rm -f nsmb.d/files/Object/bgA_5802.arc
rm -f nsmb.d/files/Object/bgA_5902.arc
rm -f nsmb.d/files/Object/bgA_5A02.arc
rm -f nsmb.d/files/Object/bgA_A302.arc
rm -f nsmb.d/files/Object/bgA_A402.arc
rm -f nsmb.d/files/Object/bgA_A502.arc
rm -f nsmb.d/files/Object/bgB_0001.arc
rm -f nsmb.d/files/Object/bgB_0102.arc
rm -f nsmb.d/files/Object/bgB_0104.arc
rm -f nsmb.d/files/Object/bgB_0202.arc
rm -f nsmb.d/files/Object/bgB_0402.arc
rm -f nsmb.d/files/Object/bgB_0502.arc
rm -f nsmb.d/files/Object/bgB_0602.arc
rm -f nsmb.d/files/Object/bgB_0702.arc
rm -f nsmb.d/files/Object/bgB_0802.arc
rm -f nsmb.d/files/Object/bgB_0902.arc
rm -f nsmb.d/files/Object/bgB_0A02.arc
rm -f nsmb.d/files/Object/bgB_0C02.arc
rm -f nsmb.d/files/Object/bgB_0D02.arc
rm -f nsmb.d/files/Object/bgB_0F01.arc
rm -f nsmb.d/files/Object/bgB_0F02.arc
rm -f nsmb.d/files/Object/bgB_1002.arc
rm -f nsmb.d/files/Object/bgB_2202.arc
rm -f nsmb.d/files/Object/bgB_2302.arc
rm -f nsmb.d/files/Object/bgB_2402.arc
rm -f nsmb.d/files/Object/bgB_2502.arc
rm -f nsmb.d/files/Object/bgB_2602.arc
rm -f nsmb.d/files/Object/bgB_2702.arc
rm -f nsmb.d/files/Object/bgB_2802.arc
rm -f nsmb.d/files/Object/bgB_2902.arc
rm -f nsmb.d/files/Object/bgB_2A02.arc
rm -f nsmb.d/files/Object/bgB_3102.arc
rm -f nsmb.d/files/Object/bgB_3302.arc
rm -f nsmb.d/files/Object/bgB_3F02.arc
rm -f nsmb.d/files/Object/bgB_4002.arc
rm -f nsmb.d/files/Object/bgB_4102.arc
rm -f nsmb.d/files/Object/bgB_4202.arc
rm -f nsmb.d/files/Object/bgB_4302.arc
rm -f nsmb.d/files/Object/bgB_4402.arc
rm -f nsmb.d/files/Object/bgB_4502.arc
rm -f nsmb.d/files/Object/bgB_4602.arc
rm -f nsmb.d/files/Object/bgB_4C02.arc
rm -f nsmb.d/files/Object/bgB_4E02.arc
rm -f nsmb.d/files/Object/bgB_4F02.arc
rm -f nsmb.d/files/Object/bgB_5002.arc
rm -f nsmb.d/files/Object/bgB_5102.arc
rm -f nsmb.d/files/Object/bgB_5202.arc
rm -f nsmb.d/files/Object/bgB_5302.arc
rm -f nsmb.d/files/Object/bgB_5602.arc
rm -f nsmb.d/files/Object/bgB_5802.arc
rm -f nsmb.d/files/Object/bgB_5902.arc
rm -f nsmb.d/files/Object/bgB_5A02.arc
rm -f nsmb.d/files/Object/bgB_A302.arc
rm -f nsmb.d/files/Object/bgB_A402.arc
rm -f nsmb.d/files/Object/bgB_A502.arc
rm -f nsmb.d/files/Object/BGM_anim_dummy.arc
rm -f nsmb.d/files/Object/big_renga_block.arc
rm -f nsmb.d/files/Object/big_shell.arc
rm -f nsmb.d/files/Object/bilikyu.arc
rm -f nsmb.d/files/Object/block_arrow.arc
rm -f nsmb.d/files/Object/block_broken.arc
rm -f nsmb.d/files/Object/block_cloud.arc
rm -f nsmb.d/files/Object/block_fly.arc
rm -f nsmb.d/files/Object/block_help.arc
rm -f nsmb.d/files/Object/block_jump.arc
rm -f nsmb.d/files/Object/block_light.arc
rm -f nsmb.d/files/Object/block_otehon.arc
rm -f nsmb.d/files/Object/block_pata.arc
rm -f nsmb.d/files/Object/block_pow.arc
rm -f nsmb.d/files/Object/block_roulette.arc
rm -f nsmb.d/files/Object/block_slide.arc
rm -f nsmb.d/files/Object/block_snake.arc
rm -f nsmb.d/files/Object/block_snake_ice.arc
rm -f nsmb.d/files/Object/block_taru.arc
rm -f nsmb.d/files/Object/boat_light_wood.arc
rm -f nsmb.d/files/Object/bolt.arc
rm -f nsmb.d/files/Object/bombhei.arc
rm -f nsmb.d/files/Object/boss_hikousen_bg.arc
rm -f nsmb.d/files/Object/boss_kameck_block.arc
rm -f nsmb.d/files/Object/boss_koopaJr_down_asiba.arc
rm -f nsmb.d/files/Object/boss_koopaJr_move_asiba.arc
rm -f nsmb.d/files/Object/boss_koopaJr_toge.arc
rm -f nsmb.d/files/Object/boss_koopa_ashiba.arc
rm -f nsmb.d/files/Object/boss_koopa_door.arc
rm -f nsmb.d/files/Object/boss_larry_block.arc
rm -f nsmb.d/files/Object/boss_lemmy_ashiba.arc
rm -f nsmb.d/files/Object/boss_morton_ashiba.arc
rm -f nsmb.d/files/Object/boss_roy_dokan.arc
rm -f nsmb.d/files/Object/boss_shutter.arc
rm -f nsmb.d/files/Object/box_iron.arc
rm -f nsmb.d/files/Object/box_iron_machine.arc
rm -f nsmb.d/files/Object/box_wood.arc
rm -f nsmb.d/files/Object/bros.arc
rm -f nsmb.d/files/Object/bros_mega.arc
rm -f nsmb.d/files/Object/bubble.arc
rm -f nsmb.d/files/Object/cage_boss_koopa.arc
rm -f nsmb.d/files/Object/chorobon.arc
rm -f nsmb.d/files/Object/choropoo.arc
rm -f nsmb.d/files/Object/circle_ground.arc
rm -f nsmb.d/files/Object/circle_ground_chika.arc
rm -f nsmb.d/files/Object/circle_ground_holeD.arc
rm -f nsmb.d/files/Object/circle_ground_holeD8.arc
rm -f nsmb.d/files/Object/circle_ground_holeD_chika.arc
rm -f nsmb.d/files/Object/circle_ground_koopa.arc
rm -f nsmb.d/files/Object/coin.arc
rm -f nsmb.d/files/Object/Copyrights.arc
rm -f nsmb.d/files/Object/crasher.arc
rm -f nsmb.d/files/Object/crow.arc
rm -f nsmb.d/files/Object/cube_kinoko.arc
rm -f nsmb.d/files/Object/daikonbou.arc
rm -f nsmb.d/files/Object/daikonbouBig.arc
rm -f nsmb.d/files/Object/dossun.arc
rm -f nsmb.d/files/Object/env_wind.arc
rm -f nsmb.d/files/Object/firepillar.arc
rm -f nsmb.d/files/Object/fire_cannon.arc
rm -f nsmb.d/files/Object/fire_rot_cannon.arc
rm -f nsmb.d/files/Object/fire_snake.arc
rm -f nsmb.d/files/Object/FrontBlack.arc
rm -f nsmb.d/files/Object/FrontBlack_small.arc
rm -f nsmb.d/files/Object/fruit.arc
rm -f nsmb.d/files/Object/fruits_kusa.arc
rm -f nsmb.d/files/Object/fruits_kusa_gake.arc
rm -f nsmb.d/files/Object/fruit_cookie.arc
rm -f nsmb.d/files/Object/fugu.arc
rm -f nsmb.d/files/Object/gabon.arc
rm -f nsmb.d/files/Object/gabon_rock.arc
rm -f nsmb.d/files/Object/gessoMini.arc
rm -f nsmb.d/files/Object/goal_set.arc
rm -f nsmb.d/files/Object/hanachan_big_body.arc
rm -f nsmb.d/files/Object/hanachan_big_head.arc
rm -f nsmb.d/files/Object/hanachan_body.arc
rm -f nsmb.d/files/Object/hanachan_head.arc
rm -f nsmb.d/files/Object/hashigo.arc
rm -f nsmb.d/files/Object/hatena_balloon.arc
rm -f nsmb.d/files/Object/hikari.arc
rm -f nsmb.d/files/Object/houdai.arc
rm -f nsmb.d/files/Object/houdai_ball.arc
rm -f nsmb.d/files/Object/houdai_rot.arc
rm -f nsmb.d/files/Object/houdai_rot_large.arc
rm -f nsmb.d/files/Object/houdai_slope.arc
rm -f nsmb.d/files/Object/huhu.arc
rm -f nsmb.d/files/Object/I_yoshi_egg.arc
rm -f nsmb.d/files/Object/ibaramushi.arc
rm -f nsmb.d/files/Object/iga_kuribo.arc
rm -f nsmb.d/files/Object/iggy.arc
rm -f nsmb.d/files/Object/iron_ball.arc
rm -f nsmb.d/files/Object/kameck_princess.arc
rm -f nsmb.d/files/Object/kanaami.arc
rm -f nsmb.d/files/Object/kanaami2.arc
rm -f nsmb.d/files/Object/kanaami_enkei.arc
rm -f nsmb.d/files/Object/kanaami_urakabe.arc
rm -f nsmb.d/files/Object/kanibo.arc
rm -f nsmb.d/files/Object/karon.arc
rm -f nsmb.d/files/Object/kazan_rock.arc
rm -f nsmb.d/files/Object/keronpa.arc
rm -f nsmb.d/files/Object/key_boss_castle.arc
rm -f nsmb.d/files/Object/killer_king.arc
rm -f nsmb.d/files/Object/killer_mag.arc
rm -f nsmb.d/files/Object/killer_mag_houdai.arc
rm -f nsmb.d/files/Object/killer_rot_houdai.arc
rm -f nsmb.d/files/Object/Kinopio.arc
rm -f nsmb.d/files/Object/kinopio_balloon.arc
rm -f nsmb.d/files/Object/koopa.arc
rm -f nsmb.d/files/Object/koopaJr.arc
rm -f nsmb.d/files/Object/koopaJr_clown.arc
rm -f nsmb.d/files/Object/koopaJr_clown_ply.arc
rm -f nsmb.d/files/Object/KoopaShip.arc
rm -f nsmb.d/files/Object/KoopaShip_2D.arc
rm -f nsmb.d/files/Object/koopa_clown.arc
rm -f nsmb.d/files/Object/koopa_clown_bomb.arc
rm -f nsmb.d/files/Object/kurage.arc
rm -f nsmb.d/files/Object/kuribo.arc
rm -f nsmb.d/files/Object/kuriboBig.arc
rm -f nsmb.d/files/Object/kuriboMini.arc
rm -f nsmb.d/files/Object/kuribo_iga.arc
rm -f nsmb.d/files/Object/larry.arc
rm -f nsmb.d/files/Object/lemmy.arc
rm -f nsmb.d/files/Object/lemmy_ball.arc
rm -f nsmb.d/files/Object/lift_boss_ludwig.arc
rm -f nsmb.d/files/Object/lift_buranko.arc
rm -f nsmb.d/files/Object/lift_dokan.arc
rm -f nsmb.d/files/Object/lift_freehole.arc
rm -f nsmb.d/files/Object/lift_guraIwa.arc
rm -f nsmb.d/files/Object/lift_guraYuka.arc
rm -f nsmb.d/files/Object/lift_han_spin.arc
rm -f nsmb.d/files/Object/lift_icebox.arc
rm -f nsmb.d/files/Object/lift_ice_ashiba.arc
rm -f nsmb.d/files/Object/lift_intore.arc
rm -f nsmb.d/files/Object/lift_katamukiyuka.arc
rm -f nsmb.d/files/Object/lift_kinoko_yoko.arc
rm -f nsmb.d/files/Object/lift_maruta.arc
rm -f nsmb.d/files/Object/lift_number_ship.arc
rm -f nsmb.d/files/Object/lift_obake_chikei.arc
rm -f nsmb.d/files/Object/lift_rakka_ashiba.arc
rm -f nsmb.d/files/Object/lift_spin_kinoko.arc
rm -f nsmb.d/files/Object/lift_suisha.arc
rm -f nsmb.d/files/Object/lift_taru.arc
rm -f nsmb.d/files/Object/lift_torokko.arc
rm -f nsmb.d/files/Object/lift_trampoline.arc
rm -f nsmb.d/files/Object/lift_turi_ashiba.arc
rm -f nsmb.d/files/Object/lift_turi_ashiba_wire.arc
rm -f nsmb.d/files/Object/lift_up_down.arc
rm -f nsmb.d/files/Object/lift_yogan_kinoko.arc
rm -f nsmb.d/files/Object/lift_zen.arc
rm -f nsmb.d/files/Object/lift_zen_chika_pori.arc
rm -f nsmb.d/files/Object/lift_zen_color_pori.arc
rm -f nsmb.d/files/Object/lift_zen_hammer.arc
rm -f nsmb.d/files/Object/lift_zen_kaihei.arc
rm -f nsmb.d/files/Object/lift_zen_kaiten.arc
rm -f nsmb.d/files/Object/lift_zen_kaiten_kanaami.arc
rm -f nsmb.d/files/Object/lift_zen_shiro.arc
rm -f nsmb.d/files/Object/lift_zen_shiro_yogan.arc
rm -f nsmb.d/files/Object/lift_zen_spin_cube.arc
rm -f nsmb.d/files/Object/lift_zen_suisya.arc
rm -f nsmb.d/files/Object/lift_zen_toge.arc
rm -f nsmb.d/files/Object/lift_zen_toride.arc
rm -f nsmb.d/files/Object/lift_zen_yogan_down.arc
rm -f nsmb.d/files/Object/light_block.arc
rm -f nsmb.d/files/Object/light_search.arc
rm -f nsmb.d/files/Object/ludwig.arc
rm -f nsmb.d/files/Object/Luigi.arc
rm -f nsmb.d/files/Object/manjirou.arc
rm -f nsmb.d/files/Object/Mario.arc
rm -f nsmb.d/files/Object/Mask_flashlight.arc
rm -f nsmb.d/files/Object/Mask_flashlight_obake.arc
rm -f nsmb.d/files/Object/mecha_koopa.arc
rm -f nsmb.d/files/Object/met.arc
rm -f nsmb.d/files/Object/met_pata.arc
rm -f nsmb.d/files/Object/met_pataBig.arc
rm -f nsmb.d/files/Object/met_toge.arc
rm -f nsmb.d/files/Object/MG_balloon.arc
rm -f nsmb.d/files/Object/MG_remo_cannon.arc
rm -f nsmb.d/files/Object/MG_RotatePanel.arc
rm -f nsmb.d/files/Object/middle_flag.arc
rm -f nsmb.d/files/Object/morton.arc
rm -f nsmb.d/files/Object/mouse.arc
rm -f nsmb.d/files/Object/mouse_hole.arc
rm -f nsmb.d/files/Object/noboribou_obake.arc
rm -f nsmb.d/files/Object/nokonokoA.arc
rm -f nsmb.d/files/Object/nokonokoB.arc
rm -f nsmb.d/files/Object/note.arc
rm -f nsmb.d/files/Object/obj_block.arc
rm -f nsmb.d/files/Object/obj_coin.arc
rm -f nsmb.d/files/Object/obj_door_obake.arc
rm -f nsmb.d/files/Object/obj_door_shiroboss.arc
rm -f nsmb.d/files/Object/obj_door_torideboss.arc
rm -f nsmb.d/files/Object/obj_envfog.arc
rm -f nsmb.d/files/Object/obj_gear.arc
rm -f nsmb.d/files/Object/obj_hana.arc
rm -f nsmb.d/files/Object/obj_hana_daishizen.arc
rm -f nsmb.d/files/Object/obj_Hgear.arc
rm -f nsmb.d/files/Object/obj_kinoko.arc
rm -f nsmb.d/files/Object/obj_kusa.arc
rm -f nsmb.d/files/Object/obj_nut.arc
rm -f nsmb.d/files/Object/obj_poisonwater.arc
rm -f nsmb.d/files/Object/obj_quicksand.arc
rm -f nsmb.d/files/Object/obj_sea_wakame.arc
rm -f nsmb.d/files/Object/obj_torch.arc
rm -f nsmb.d/files/Object/obj_turara_rakka.arc
rm -f nsmb.d/files/Object/obj_turara_rakka_Big.arc
rm -f nsmb.d/files/Object/obj_waterfloat.arc
rm -f nsmb.d/files/Object/obj_waterscreen.arc
rm -f nsmb.d/files/Object/obj_yashi.arc
rm -f nsmb.d/files/Object/P_rcha.arc
rm -f nsmb.d/files/Object/pakkun_black.arc
rm -f nsmb.d/files/Object/pakkun_walk.arc
rm -f nsmb.d/files/Object/pakkun_water.arc
rm -f nsmb.d/files/Object/peach.arc
rm -f nsmb.d/files/Object/penguin2.arc
rm -f nsmb.d/files/Object/poltergeist.arc
rm -f nsmb.d/files/Object/pukupuku.arc
rm -f nsmb.d/files/Object/pukupuku_toge.arc
rm -f nsmb.d/files/Object/red_ring.arc
rm -f nsmb.d/files/Object/remo_kanaami.arc
rm -f nsmb.d/files/Object/remo_lift.arc
rm -f nsmb.d/files/Object/remo_lift_line.arc
rm -f nsmb.d/files/Object/remo_lift_soroban.arc
rm -f nsmb.d/files/Object/remo_lift_up.arc
rm -f nsmb.d/files/Object/roy.arc
rm -f nsmb.d/files/Object/sanbo.arc
rm -f nsmb.d/files/Object/sandpillar.arc
rm -f nsmb.d/files/Object/shell_fish.arc
rm -f nsmb.d/files/Object/sled_boss_iggy.arc
rm -f nsmb.d/files/Object/snake_block.arc
rm -f nsmb.d/files/Object/staffRollBlock.arc
rm -f nsmb.d/files/Object/star_coin.arc
rm -f nsmb.d/files/Object/switch.arc
rm -f nsmb.d/files/Object/switch_koopa.arc
rm -f nsmb.d/files/Object/tarzantsuta.arc
rm -f nsmb.d/files/Object/togezo.arc
rm -f nsmb.d/files/Object/treasure_box.arc
rm -f nsmb.d/files/Object/unizo.arc
rm -f nsmb.d/files/Object/unizoBig.arc
rm -f nsmb.d/files/Object/untei_rope.arc
rm -f nsmb.d/files/Object/W4_Fly_Boss.arc
rm -f nsmb.d/files/Object/W6_Fly_Boss.arc
rm -f nsmb.d/files/Object/W7_shiroboss_bg_D.arc
rm -f nsmb.d/files/Object/W7_shiroboss_bg_M.arc
rm -f nsmb.d/files/Object/W7_shiroboss_bg_U.arc
rm -f nsmb.d/files/Object/W8_Fly_Boss.arc
rm -f nsmb.d/files/Object/wanwan.arc
rm -f nsmb.d/files/Object/wanwan_boss_iggy.arc
rm -f nsmb.d/files/Object/warp_cannon.arc
rm -f nsmb.d/files/Object/waterPlate_W4boss.arc
rm -f nsmb.d/files/Object/wendy.arc
rm -f nsmb.d/files/Object/Y_TexGreen.arc

rm -rf nsmb.d/files/Replay/otakara/
rm -rf nsmb.d/files/Replay/otehon/
rm -f nsmb.d/files/Replay/title/*.*

rm -f nsmb.d/files/Sound/stream/athletic_fast_lr.n.32.brstm
rm -f nsmb.d/files/Sound/stream/athletic_lr.n.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_HIKOUSEN.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_HIKOUSEN_BOSS.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_HIKOUSEN_BOSS_fast.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_HIKOUSEN_CLEAR.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_HIKOUSEN_fast.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_HIKOUSEN_ROUKA.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_HIKOUSEN_ROUKA_fast.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_lastcasle_appear_lr.ry.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_LAST_CASTLE_ROUKA_FAST_lr.ry.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_LAST_CASTLE_ROUKA_lr.ry.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_MAP_W5.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_MAP_W7.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_MAP_W8.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_MG_BTL.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_MG_BTL_FANFARE.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_MINIGAME_FANFARE_BAD.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_MINIGAME_FANFARE_GOOD.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_MINIGAME_FANFARE_KOOPA.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_OBAKE.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_OBAKE_fast.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_SIRO.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_SIRO_CLEAR.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_SIRO_fast.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_SUICHU.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_SUICHU_fast.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_TORIDE_BOSS.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_TORIDE_BOSS_fast.32.brstm
rm -f nsmb.d/files/Sound/stream/BGM_TORIDE_CLEAR.32.brstm
rm -f nsmb.d/files/Sound/stream/cheepfanfare_lr.ry.32.brstm
rm -f nsmb.d/files/Sound/stream/DEMO_end_lr.ry.32.brstm
rm -f nsmb.d/files/Sound/stream/DEMO_op_lr.ry.32.brstm
rm -f nsmb.d/files/Sound/stream/down_multi_lr.n.32.brstm
rm -f nsmb.d/files/Sound/stream/dummy_fanfare_lr.ry.32.brstm
rm -f nsmb.d/files/Sound/stream/dummy_harp_lr.ry.32.brstm
rm -f nsmb.d/files/Sound/stream/kazan_fast_lr.n.32.brstm
rm -f nsmb.d/files/Sound/stream/kazan_lr.n.32.brstm
rm -f nsmb.d/files/Sound/stream/kazan_tika_fast_lr.ry.32.brstm
rm -f nsmb.d/files/Sound/stream/kazan_tika_lr.ry.32.brstm
rm -f nsmb.d/files/Sound/stream/LastBoss_fanfare_lr.ry.32.brstm
rm -f nsmb.d/files/Sound/stream/LastBoss_Harp_lr.ry.32.brstm
rm -f nsmb.d/files/Sound/stream/mori_fast_lr.ry.32.brstm
rm -f nsmb.d/files/Sound/stream/mori_lr.ry.32.brstm
rm -f nsmb.d/files/Sound/stream/multi_fail_lr.n.32.brstm
rm -f nsmb.d/files/Sound/stream/result_multi_lr.o.32.brstm
rm -f nsmb.d/files/Sound/stream/select_map01_nohara_lr.n.32.brstm
rm -f nsmb.d/files/Sound/stream/select_map02_sabaku.ry.32.brstm
rm -f nsmb.d/files/Sound/stream/select_map03_yuki.ry.32.brstm
rm -f nsmb.d/files/Sound/stream/select_map04_umii.ry.32.brstm
rm -f nsmb.d/files/Sound/stream/select_map06_cliff_lr.n.32.brstm
rm -f nsmb.d/files/Sound/stream/select_map09_rainbow_lr.n.32.brstm
rm -f nsmb.d/files/Sound/stream/shiro_boss_fast_lr.n.32.brstm
rm -f nsmb.d/files/Sound/stream/shiro_boss_lr.n.32.brstm
rm -f nsmb.d/files/Sound/stream/staffcredit_lr.ry.32.brstm
rm -f nsmb.d/files/Sound/stream/STRM_BGM_BONUS.brstm
rm -f nsmb.d/files/Sound/stream/STRM_BGM_BONUS_FAST.brstm
rm -f nsmb.d/files/Sound/stream/STRM_BGM_CHIJOU_FAST.brstm
rm -f nsmb.d/files/Sound/stream/STRM_BGM_CHIKA.brstm
rm -f nsmb.d/files/Sound/stream/STRM_BGM_CHIKA_FAST.brstm
rm -f nsmb.d/files/Sound/stream/STRM_BGM_LAST_BOSS2.brstm
rm -f nsmb.d/files/Sound/stream/STRM_BGM_LAST_BOSS2_FAST.brstm
rm -f nsmb.d/files/Sound/stream/STRM_BGM_MINIGAME.brstm
rm -f nsmb.d/files/Sound/stream/STRM_BGM_SABAKU.brstm
rm -f nsmb.d/files/Sound/stream/STRM_BGM_SABAKU_FAST.brstm
rm -f nsmb.d/files/Sound/stream/STRM_BGM_SANBASHI.brstm
rm -f nsmb.d/files/Sound/stream/STRM_BGM_SANBASHI_FAST.brstm
rm -f nsmb.d/files/Sound/stream/STRM_BGM_YUKI.brstm
rm -f nsmb.d/files/Sound/stream/STRM_BGM_YUKI_FAST.brstm
rm -f nsmb.d/files/Sound/stream/toride_fast_lr.n.32.brstm
rm -f nsmb.d/files/Sound/stream/toride_lr.n.32.brstm

rm -f nsmb.d/files/Stage/*.*
rm -f nsmb.d/files/Stage/Texture/Pa0_jyotyu.arc
rm -f nsmb.d/files/Stage/Texture/Pa0_jyotyu_chika.arc
rm -f nsmb.d/files/Stage/Texture/Pa0_jyotyu_setsugen.arc
rm -f nsmb.d/files/Stage/Texture/Pa0_jyotyu_staffRoll.arc
rm -f nsmb.d/files/Stage/Texture/Pa0_jyotyu_yougan.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_KinokoHouse.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_MG_house.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_daishizen.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_dokan_naibu.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_gake.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_gake_yougan.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_hikousen.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_hikousen2.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_kaigan.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_koopa_out.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_korichika.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_kurayami_chika.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_nohara.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_nohara2.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_obake.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_obake_soto.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_peach_castle.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_sabaku.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_sabaku_chika.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_setsugen.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_shiro.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_shiro_boss1.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_shiro_koopa.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_shiro_sora.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_shiro_yogan.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_suichu.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_toride.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_toride_boss1.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_toride_boss2.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_toride_boss3.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_toride_boss4.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_toride_boss5.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_toride_boss6.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_toride_boss7.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_toride_boss8.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_toride_kori.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_toride_sabaku.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_toride_soto.arc
rm -f nsmb.d/files/Stage/Texture/Pa1_toride_yogan.arc
rm -f nsmb.d/files/Stage/Texture/Pa2_dokan_naibu.arc
rm -f nsmb.d/files/Stage/Texture/Pa2_doukutu2.arc
rm -f nsmb.d/files/Stage/Texture/Pa2_doukutu3.arc
rm -f nsmb.d/files/Stage/Texture/Pa2_doukutu4.arc
rm -f nsmb.d/files/Stage/Texture/Pa2_doukutu5.arc
rm -f nsmb.d/files/Stage/Texture/Pa2_doukutu7.arc
rm -f nsmb.d/files/Stage/Texture/Pa2_doukutu8.arc
rm -f nsmb.d/files/Stage/Texture/Pa2_gake.arc
rm -f nsmb.d/files/Stage/Texture/Pa2_hikousen.arc
rm -f nsmb.d/files/Stage/Texture/Pa2_hikousen2.arc
rm -f nsmb.d/files/Stage/Texture/Pa2_kinoko.arc
rm -f nsmb.d/files/Stage/Texture/Pa2_shiro_koopa.arc
rm -f nsmb.d/files/Stage/Texture/Pa2_sora.arc
rm -f nsmb.d/files/Stage/Texture/Pa3_MG_house_ami_rail.arc
rm -f nsmb.d/files/Stage/Texture/Pa3_daishizen.arc
rm -f nsmb.d/files/Stage/Texture/Pa3_hanatari_saka.arc
rm -f nsmb.d/files/Stage/Texture/Pa3_rail_white.arc
rm -f nsmb.d/files/Stage/Texture/Pa3_shiro_koopa.arc

rm -f nsmb.d/files/WorldMap/character_SV.arc
rm -f nsmb.d/files/WorldMap/cobAnchor.arc
rm -f nsmb.d/files/WorldMap/cobAntlion.arc
rm -f nsmb.d/files/WorldMap/cobBoard.arc
rm -f nsmb.d/files/WorldMap/cobCannon.arc
rm -f nsmb.d/files/WorldMap/cobCastle.arc
rm -f nsmb.d/files/WorldMap/cobCourse.arc
rm -f nsmb.d/files/WorldMap/cobDokanRoute.arc
rm -f nsmb.d/files/WorldMap/cobGhost.arc
rm -f nsmb.d/files/WorldMap/cobGrid.arc
rm -f nsmb.d/files/WorldMap/cobHatenaSwitch.arc
rm -f nsmb.d/files/WorldMap/cobKiller.arc
rm -f nsmb.d/files/WorldMap/cobKinoko1up.arc
rm -f nsmb.d/files/WorldMap/cobKinokoRed.arc
rm -f nsmb.d/files/WorldMap/cobKinokoStar.arc
rm -f nsmb.d/files/WorldMap/cobKinopio.arc
rm -f nsmb.d/files/WorldMap/cobKoopaCastle.arc
rm -f nsmb.d/files/WorldMap/cobKoopaShip.arc
rm -f nsmb.d/files/WorldMap/cobPeachCastle.arc
rm -f nsmb.d/files/WorldMap/cobRotary.arc
rm -f nsmb.d/files/WorldMap/cobSandpillar.arc
rm -f nsmb.d/files/WorldMap/cobStart.arc
rm -f nsmb.d/files/WorldMap/cobSurrender.arc
rm -f nsmb.d/files/WorldMap/cobToride.arc
rm -f nsmb.d/files/WorldMap/cobTsuta.arc
rm -f nsmb.d/files/WorldMap/cobfirepillar.arc
rm -f nsmb.d/files/WorldMap/CS_W1.arc
rm -f nsmb.d/files/WorldMap/CS_W2.arc
rm -f nsmb.d/files/WorldMap/CS_W3.arc
rm -f nsmb.d/files/WorldMap/CS_W3_Palm.arc
rm -f nsmb.d/files/WorldMap/CS_W4.arc
rm -f nsmb.d/files/WorldMap/CS_W4_Palm.arc
rm -f nsmb.d/files/WorldMap/CS_W5.arc
rm -f nsmb.d/files/WorldMap/CS_W6.arc
rm -f nsmb.d/files/WorldMap/CS_W7.arc
rm -f nsmb.d/files/WorldMap/CS_W8.arc
rm -f nsmb.d/files/WorldMap/CS_W9.arc
rm -f nsmb.d/files/WorldMap/CollectionCoinCourseSort.arc
rm -f nsmb.d/files/WorldMap/rcha.arc
rm -f nsmb.d/files/WorldMap/RouteInfo.arc
rm -f nsmb.d/files/WorldMap/WS_W1.arc
rm -f nsmb.d/files/WorldMap/WS_W2.arc
rm -f nsmb.d/files/WorldMap/WS_W3.arc
rm -f nsmb.d/files/WorldMap/WS_W4.arc
rm -f nsmb.d/files/WorldMap/WS_W5.arc
rm -f nsmb.d/files/WorldMap/WS_W6.arc
rm -f nsmb.d/files/WorldMap/WS_W7.arc
rm -f nsmb.d/files/WorldMap/WS_W8.arc
rm -f nsmb.d/files/WorldMap/WS_W9.arc
rm -f nsmb.d/files/WorldMap/WorldSelect.arc

case $gameid in
	SMNP01)
		rm -f nsmb.d/files/EU/EngEU/staffroll/staffroll.bin
		rm -f nsmb.d/files/EU/EngEU/Layout/corseClear/corseClear.arc
		rm -f nsmb.d/files/EU/FraEU/staffroll/staffroll.bin
		rm -f nsmb.d/files/EU/FraEU/Layout/corseClear/corseClear.arc
		rm -f nsmb.d/files/EU/GerEU/staffroll/staffroll.bin
		rm -f nsmb.d/files/EU/GerEU/Layout/corseClear/corseClear.arc
		rm -f nsmb.d/files/EU/ItaEU/staffroll/staffroll.bin
		rm -f nsmb.d/files/EU/ItaEU/Layout/corseClear/corseClear.arc
		rm -f nsmb.d/files/EU/SpaEU/staffroll/staffroll.bin
		rm -f nsmb.d/files/EU/SpaEU/Layout/corseClear/corseClear.arc
		;;
	SMNE01)
		rm -f nsmb.d/files/US/EngUS/staffroll/staffroll.bin
		rm -f nsmb.d/files/US/EngUS/Layout/corseClear/corseClear.arc
		rm -f nsmb.d/files/US/FraUS/staffroll/staffroll.bin
		rm -f nsmb.d/files/US/FraUS/Layout/corseClear/corseClear.arc
		rm -f nsmb.d/files/US/SpaUS/staffroll/staffroll.bin
		rm -f nsmb.d/files/US/SpaUS/Layout/corseClear/corseClear.arc
		;;
	SMNJ01)
		rm -f nsmb.d/files/JP/staffroll/staffroll.bin
		rm -f nsmb.d/files/JP/Layout/corseClear/corseClear.arc
		;;
esac

echo ''
echo Copying mod files...

cp NSMASDemo/Tilesets/* nsmb.d/files/Stage/Texture/ 2>/dev/null
cp NSMASDemo/Effects/* nsmb.d/files/Effect/ 2>/dev/null
cp NSMASDemo/TitleReplay/* nsmb.d/files/Replay/title/ 2>/dev/null
cp NSMASDemo/BGs/* nsmb.d/files/Object/ 2>/dev/null
cp NSMASDemo/SpriteTex/* nsmb.d/files/Object/ 2>/dev/null
cp NSMASDemo/Layouts/* nsmb.d/files/Layout/ 2>/dev/null
cp NSMASDemo/Music/* nsmb.d/files/Sound/stream/ 2>/dev/null
cp NSMASDemo/Music/rsar/* nsmb.d/files/Sound/ 2>/dev/null

case $gameid in
	SMNP01)
		cp NSMASDemo/Font/* nsmb.d/files/EU/EngEU/Font/ 2>/dev/null
		cp NSMASDemo/Font/* nsmb.d/files/EU/FraEU/Font/ 2>/dev/null
		cp NSMASDemo/Font/* nsmb.d/files/EU/GerEU/Font/ 2>/dev/null
		cp NSMASDemo/Font/* nsmb.d/files/EU/ItaEU/Font/ 2>/dev/null
		cp NSMASDemo/Font/* nsmb.d/files/EU/SpaEU/Font/ 2>/dev/null
		cp NSMASDemo/Message/* nsmb.d/files/EU/EngEU/Message/ 2>/dev/null
		cp NSMASDemo/Message/* nsmb.d/files/EU/FraEU/Message/ 2>/dev/null
		cp NSMASDemo/Message/* nsmb.d/files/EU/GerEU/Message/ 2>/dev/null
		cp NSMASDemo/Message/* nsmb.d/files/EU/ItaEU/Message/ 2>/dev/null
		cp NSMASDemo/Message/* nsmb.d/files/EU/SpaEU/Message/ 2>/dev/null
		cp NSMASDemo/OthersP/* nsmb.d/files/EU/Layout/openingTitle/ 2>/dev/null
		;;
	SMNE01)
		cp NSMASDemo/Font/* nsmb.d/files/US/EngUS/Font/ 2>/dev/null
		cp NSMASDemo/Font/* nsmb.d/files/US/FraUS/Font/ 2>/dev/null
		cp NSMASDemo/Font/* nsmb.d/files/US/SpaUS/Font/ 2>/dev/null
		cp NSMASDemo/Message/* nsmb.d/files/US/EngUS/Message/ 2>/dev/null
		cp NSMASDemo/Message/* nsmb.d/files/US/FraUS/Message/ 2>/dev/null
		cp NSMASDemo/Message/* nsmb.d/files/US/SpaUS/Message/ 2>/dev/null
		cp NSMASDemo/OthersE/* nsmb.d/files/US/Layout/openingTitle/ 2>/dev/null
		;;
	SMNJ01)
		cp NSMASDemo/Font/* nsmb.d/files/JP/Font/ 2>/dev/null
		cp NSMASDemo/Message/* nsmb.d/files/JP/Message/ 2>/dev/null
		cp NSMASDemo/OthersJ/* nsmb.d/files/JP/Layout/openingTitle/ 2>/dev/null
		;;
esac

mkdir -p nsmb.d/files/LevelSamples
cp NSMASDemo/LevelSamples/* nsmb.d/files/LevelSamples/ 2>/dev/null
cp NSMASDemo/Others/charaChangeSelectContents.arc* nsmb.d/files/Layout/charaChangeSelectContents/charaChangeSelectContents.arc 2>/dev/null
cp NSMASDemo/Others/characterChange.arc* nsmb.d/files/Layout/characterChange/characterChange.arc 2>/dev/null
cp NSMASDemo/Others/continue.arc* nsmb.d/files/Layout/continue/continue.arc 2>/dev/null
cp NSMASDemo/Others/controllerInformation.arc* nsmb.d/files/Layout/controllerInformation/controllerInformation.arc 2>/dev/null
cp NSMASDemo/Others/corseSelectMenu.arc* nsmb.d/files/Layout/corseSelectMenu/corseSelectMenu.arc 2>/dev/null
cp NSMASDemo/Others/dateFile.arc* nsmb.d/files/Layout/dateFile/dateFile.arc 2>/dev/null
cp NSMASDemo/Others/easyPairing.arc* nsmb.d/files/Layout/easyPairing/easyPairing.arc 2>/dev/null
cp NSMASDemo/Others/extensionControllerNunchuk.arc* nsmb.d/files/Layout/extensionControllerNunchuk/extensionControllerNunchuk.arc 2>/dev/null
cp NSMASDemo/Others/extensionControllerYokomochi.arc* nsmb.d/files/Layout/extensionControllerYokomochi/extensionControllerYokomochi.arc 2>/dev/null
cp NSMASDemo/Others/fileSelectBase.arc* nsmb.d/files/Layout/fileSelectBase/fileSelectBase.arc 2>/dev/null
cp NSMASDemo/Others/fileSelectPlayer.arc* nsmb.d/files/Layout/fileSelectPlayer/fileSelectPlayer.arc 2>/dev/null
cp NSMASDemo/Others/gameScene.arc* nsmb.d/files/Layout/gameScene/gameScene.arc 2>/dev/null
cp NSMASDemo/Others/infoWindow.arc* nsmb.d/files/Layout/infoWindow/infoWindow.arc 2>/dev/null
cp NSMASDemo/Others/miniGameCannon.arc* nsmb.d/files/Layout/miniGameCannon/miniGameCannon.arc 2>/dev/null
cp NSMASDemo/Others/miniGameWire.arc* nsmb.d/files/Layout/miniGameWire/miniGameWire.arc 2>/dev/null
cp NSMASDemo/Others/pauseMenu.arc* nsmb.d/files/Layout/pauseMenu/pauseMenu.arc 2>/dev/null
cp NSMASDemo/Others/preGame.arc* nsmb.d/files/Layout/preGame/preGame.arc 2>/dev/null
cp NSMASDemo/Others/select_cursor.arc* nsmb.d/files/Layout/select_cursor/select_cursor.arc 2>/dev/null
cp NSMASDemo/Others/sequenceBG.arc* nsmb.d/files/Layout/sequenceBG/sequenceBG.arc 2>/dev/null
cp NSMASDemo/Others/staffCredit.arc* nsmb.d/files/Layout/staffCredit/staffCredit.arc 2>/dev/null
cp NSMASDemo/Others/stockItem.arc* nsmb.d/files/Layout/stockItem/stockItem.arc 2>/dev/null
cp NSMASDemo/Others/stockItemShadow.arc* nsmb.d/files/Layout/stockItemShadow/stockItemShadow.arc 2>/dev/null
cp NSMASDemo/Others/yesnoWindow.arc* nsmb.d/files/Layout/yesnoWindow/yesnoWindow.arc 2>/dev/null

mkdir -p nsmb.d/files/Maps
cp NSMASDemo/Maps/* nsmb.d/files/Maps/ 2>/dev/null
mkdir -p nsmb.d/files/Maps/Texture
cp NSMASDemo/Maps/Texture/* nsmb.d/files/Maps/Texture/ 2>/dev/null
cp NSMASDemo/Stages/* nsmb.d/files/Stage/ 2>/dev/null

mkdir -p nsmb.d/files/NewerRes
cp NSMASDemo/NewerRes/* nsmb.d/files/NewerRes/ 2>/dev/null

case $basever in
	EURv1)
		rm -f nsmb.d/files/NewerRes/DLCodeEU_2.bin
		rm -f nsmb.d/files/NewerRes/DLCodeJP_1.bin
		rm -f nsmb.d/files/NewerRes/DLCodeJP_2.bin
		rm -f nsmb.d/files/NewerRes/DLCodeUS_1.bin
		rm -f nsmb.d/files/NewerRes/DLCodeUS_2.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsEU_2.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsJP_1.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsJP_2.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsUS_1.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsUS_2.bin
		rm -f nsmb.d/files/NewerRes/SystemEU_2.bin
		rm -f nsmb.d/files/NewerRes/SystemJP_1.bin
		rm -f nsmb.d/files/NewerRes/SystemJP_2.bin
		rm -f nsmb.d/files/NewerRes/SystemUS_1.bin
		rm -f nsmb.d/files/NewerRes/SystemUS_2.bin
		;;
	EURv2)
		rm -f nsmb.d/files/NewerRes/DLCodeEU_1.bin
		rm -f nsmb.d/files/NewerRes/DLCodeJP_1.bin
		rm -f nsmb.d/files/NewerRes/DLCodeJP_2.bin
		rm -f nsmb.d/files/NewerRes/DLCodeUS_1.bin
		rm -f nsmb.d/files/NewerRes/DLCodeUS_2.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsEU_1.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsJP_1.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsJP_2.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsUS_1.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsUS_2.bin
		rm -f nsmb.d/files/NewerRes/SystemEU_1.bin
		rm -f nsmb.d/files/NewerRes/SystemJP_1.bin
		rm -f nsmb.d/files/NewerRes/SystemJP_2.bin
		rm -f nsmb.d/files/NewerRes/SystemUS_1.bin
		rm -f nsmb.d/files/NewerRes/SystemUS_2.bin
		;;
	USAv1)
		rm -f nsmb.d/files/NewerRes/DLCodeEU_1.bin
		rm -f nsmb.d/files/NewerRes/DLCodeEU_2.bin
		rm -f nsmb.d/files/NewerRes/DLCodeJP_1.bin
		rm -f nsmb.d/files/NewerRes/DLCodeJP_2.bin
		rm -f nsmb.d/files/NewerRes/DLCodeUS_2.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsEU_1.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsEU_2.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsJP_1.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsJP_2.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsUS_2.bin
		rm -f nsmb.d/files/NewerRes/SystemEU_1.bin
		rm -f nsmb.d/files/NewerRes/SystemEU_2.bin
		rm -f nsmb.d/files/NewerRes/SystemJP_1.bin
		rm -f nsmb.d/files/NewerRes/SystemJP_2.bin
		rm -f nsmb.d/files/NewerRes/SystemUS_2.bin
		;;
	USAv2)
		rm -f nsmb.d/files/NewerRes/DLCodeEU_1.bin
		rm -f nsmb.d/files/NewerRes/DLCodeEU_2.bin
		rm -f nsmb.d/files/NewerRes/DLCodeJP_1.bin
		rm -f nsmb.d/files/NewerRes/DLCodeJP_2.bin
		rm -f nsmb.d/files/NewerRes/DLCodeUS_1.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsEU_1.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsEU_2.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsJP_1.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsJP_2.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsUS_1.bin
		rm -f nsmb.d/files/NewerRes/SystemEU_1.bin
		rm -f nsmb.d/files/NewerRes/SystemEU_2.bin
		rm -f nsmb.d/files/NewerRes/SystemJP_1.bin
		rm -f nsmb.d/files/NewerRes/SystemJP_2.bin
		rm -f nsmb.d/files/NewerRes/SystemUS_1.bin
		;;
	JPNv1)
		rm -f nsmb.d/files/NewerRes/DLCodeEU_1.bin
		rm -f nsmb.d/files/NewerRes/DLCodeEU_2.bin
		rm -f nsmb.d/files/NewerRes/DLCodeJP_2.bin
		rm -f nsmb.d/files/NewerRes/DLCodeUS_1.bin
		rm -f nsmb.d/files/NewerRes/DLCodeUS_2.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsEU_1.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsEU_2.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsJP_2.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsUS_1.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsUS_2.bin
		rm -f nsmb.d/files/NewerRes/SystemEU_1.bin
		rm -f nsmb.d/files/NewerRes/SystemEU_2.bin
		rm -f nsmb.d/files/NewerRes/SystemJP_2.bin
		rm -f nsmb.d/files/NewerRes/SystemUS_1.bin
		rm -f nsmb.d/files/NewerRes/SystemUS_2.bin
		;;
	JPNv2)
		rm -f nsmb.d/files/NewerRes/DLCodeEU_1.bin
		rm -f nsmb.d/files/NewerRes/DLCodeEU_2.bin
		rm -f nsmb.d/files/NewerRes/DLCodeJP_1.bin
		rm -f nsmb.d/files/NewerRes/DLCodeUS_1.bin
		rm -f nsmb.d/files/NewerRes/DLCodeUS_2.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsEU_1.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsEU_2.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsJP_1.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsUS_1.bin
		rm -f nsmb.d/files/NewerRes/DLRelocsUS_2.bin
		rm -f nsmb.d/files/NewerRes/SystemEU_1.bin
		rm -f nsmb.d/files/NewerRes/SystemEU_2.bin
		rm -f nsmb.d/files/NewerRes/SystemJP_1.bin
		rm -f nsmb.d/files/NewerRes/SystemUS_1.bin
		rm -f nsmb.d/files/NewerRes/SystemUS_2.bin
		;;
esac

[ "$gameid" = SMNP01 ] && gameid=SMNP79
[ "$gameid" = SMNE01 ] && gameid=SMNE79
[ "$gameid" = SMNJ01 ] && gameid=SMNJ79

echo ''
echo Applying memory patches to main executable...
wit dolpatch nsmb.d/sys/main.dol xml=patch/patch.xml -s NSMASDemo -q

echo ''
echo Format Selection:
echo 1. ISO
echo 2. WBFS
echo "3. Extracted Filesystem (ADVANCED USERS ONLY)"
echo Enter the number corresponding to the format you want

end() {
	echo ''
	echo "All done!"
	pause
	exit
}

while :; do
	printf 'Ender Number and press Enter: '
	read -r extinput
	case $extinput in
		1) fileext=iso ;;
		2) fileext=wbfs ;;
		3) end ;;
		*)
			echo ''
			echo Invalid option selected.
			continue
			;;
	esac
	break
done

case $fileext in
	iso) destpath="Newer Super Mario All-Stars Demo_${gameid}_$basever.$fileext" ;;
	wbfs)
		mkdir -p "Newer Super Mario All-Stars Demo [$gameid]"
		destpath="Newer Super Mario All-Stars Demo [$gameid]/$gameid.$fileext"
		;;
esac

echo ''
echo Rebuilding game...
wit copy nsmb.d "$destpath" -ovv --disc-id="$gameid" --name="Newer Super Mario All-Stars Demo"

echo ''
echo Cleaning up...
rm -rf nsmb.d
end
