--������Ķ�����������buff�ű�

Include("scripts/Include/Player.lh");

function OnUse(player)
	player.AddBuff(0, 99, 1289, 1, 1)
	player.SendSystemMessage(GetEditorString(2, 8085))
	return false, true
end;
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com