--生活技能阅读使用道具后获得佛学经验60点
-- ITEM脚本, 在玩家使用道具的时候触发
Include("scripts/Include/Player.lh");

function OnUse(player)
		player.AddProfessionProficiency(9, 60)
	return false, true
end;
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com