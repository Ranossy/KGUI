---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��_̫�ؾ���_������ɢ�������.lua
-- ����ʱ��:	2013/6/3 17:20:30
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		return
	end

	if not target then
		return
	end

	local nplayerID
	if target.GetBuff(7689, 1) then
		local buff = target.GetBuff(7689, 1)
		if buff.nLeftActiveCount <= 3 then
			nplayerID = buff.nCustomValue
		else
			return
		end
	end

	local player = GetPlayer(nplayerID)
	if not player then
		return
	end

	player.CastSkill(9015, 1, TARGET.PLAYER, target.dwID)
	if target and target.GetBuff(7689,1) then
		target.DelBuff(7689, 1)
	end

end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID,dwSkillSrcID)

end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com