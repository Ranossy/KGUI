---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�����ڳ����߷�/ˮ����ɢ.lua
-- ����ʱ��:	2013/9/6 11:12:45
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	--local player = GetPlayer(dwCharacterID)
	--if player.nMoveState ~= 16 then
	--player.nCurrentMana = player.nCurrentMana + 20000
	--player.AddBuff(dwCharacterID, player.nLevel, 6520, 1, 1)
	--end
end
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	if nLeftFrame ~= 0 and player.nMoveState ~= 16 then
		player.nCurrentMana = player.nCurrentMana + 20000
		player.AddBuff(dwCharacterID, player.nLevel, 6520, 1, 1)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com