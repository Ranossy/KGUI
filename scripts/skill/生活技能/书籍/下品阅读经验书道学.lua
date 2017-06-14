--生活技能阅读道具使用后获得道学经验25点。
Include("scripts/Include/Player.lh");

function OnUse(player)
		player.AddProfessionProficiency(10, 25)
	return false, true
end;
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com