--������Ķ�����������buff�ű�

Include("scripts/Include/Player.lh");

function OnUse(player)
	player.AddBuff(0, 99, 380, 1, 1)
	player.SendSystemMessage(GetEditorString(2, 8081))
	return false, true
end;
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com