---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/90����Ѩ/������ɢ����.lua
-- ����ʱ��:	2013/4/24 20:11:15
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.DelBuff(5703, 1)

	--���������Ѩ��Ѫֵ����50%������3��60%����
	if player.GetSkillLevel(14761) == 1 then
		if player.nCurrentLife <= player.nMaxLife * 0.5 then
			player.AddBuff(player.dwID, player.nLevel, 9836, 1)
		end
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com