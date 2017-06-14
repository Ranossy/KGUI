--生活技能阅读使用道具后获得道学经验值45点
Include("scripts/Include/Player.lh");

function OnUse(player)
		player.AddProfessionProficiency(10, 45)
	return false, true
end;
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com