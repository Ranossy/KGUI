---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�嶾/90����Ѩ/��˹Ƽӱ��buff.lua
-- ����ʱ��:	2014/7/19 21:10:27
-- �����û�:	mengxiangfei
-- �ű�˵��:
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end

	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	if player.GetSkillLevel(9479) == 1 then
		target.AddBuff(player.dwID, player.nLevel, 8104, 1)
	else
		if not target.GetBuff(2313, 1) then
			target.AddBuff(player.dwID, player.nLevel, 2313, 1)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com