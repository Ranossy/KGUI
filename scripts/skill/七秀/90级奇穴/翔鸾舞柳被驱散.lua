---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/�����������ɢ.lua
-- ����ʱ��:	2013/8/19 15:16:19
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID, dwSkillSrcID)

end
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	--[[
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	if nLeftFrame ~= 0 and player.nMoveState ~= 16 and player.dwShapeShiftID == 0 and not player.GetBuff(7913, 1) then
		player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.06
	end
	--]]
end

function OnDetach(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	if nLeftFrame ~= 0 and player.nMoveState ~= 16 and player.dwShapeShiftID == 0 and not player.GetBuff(7913, 1) then
		player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.06
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com