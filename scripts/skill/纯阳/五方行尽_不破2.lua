---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/�巽�о�_����1.lua
-- ����ʱ��:	2013/5/11 21:24:49
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local character = nil
	if IsPlayer(dwCharacterID) then
		character = GetPlayer(dwCharacterID)
	else
		character = GetNpc(dwCharacterID)
	end
	--if character then 
	--character.AddBuff(0,99,2289,1)
	--end
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	if player.GetSkillLevel(5841) == 0 then
		if character then 
			character.AddBuff(0, 99, 2289, 2)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com