---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�����ڳ����߷�/����ɢ.lua
-- ����ʱ��:	2013/9/9 10:58:40
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.nMoveState ~= 16 then
		--player.AddBuff(dwCharacterID, player.nLevel, 6522, 1, 1)
		--player.AddBuff(dwCharacterID, player.nLevel, 6523, 1, 1)
	end
end
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	if nLeftFrame ~= 0 and player.nMoveState ~= 16 then
		player.AddBuff(dwCharacterID, player.nLevel, 6522, 1, 1)
		player.AddBuff(player.dwID, player.nLevel, 6523, 1, 1)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com