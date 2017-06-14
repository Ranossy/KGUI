--生活技能阅读完成任务添加buff脚本

Include("scripts/Include/Player.lh");

function OnUse(player)
	player.AddBuff(0, 99, 1289, 1, 1)
	player.SendSystemMessage(GetEditorString(2, 8085))
	return false, true
end;
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com