---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/��ŵ�����.lua
-- ����ʱ��:	2013/4/27 11:47:00
-- �����û�:	taoli
-- �ű�˵��:	
--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end

	if not target then
		return
	end
	
	if player.GetSkillLevel(6006) == 1 then
		player.AddBuff(dwSkillSrcID, player.nLevel, 5750, 1, 1)
	end

	if player.GetSkillLevel(14680) == 1 then
		target.AddBuff(player.dwID, player.nLevel, 9746, 1, 6)	--6��30%����Ч��
		target.AddBuff(player.dwID, player.nLevel, 4428, 1, 6)	--6��50%����Ч��
	else
		local nlev = player.GetSkillLevel(3981)
		if nlev ~= 0 then
			target.AddBuff(player.dwID, player.nLevel, 4429, nlev)	--12��10%�����˺�Ч��
			target.AddBuff(player.dwID, player.nLevel, 4428, 1, 12)	--12��50%����Ч��
		end
	end

	ModityCDToUI(player, 3981, 0, 0)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com