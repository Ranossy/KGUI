---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/�������buff���_4����.lua
-- ����ʱ��:	2013/8/22 15:19:22
-- �����û�:	xueyan
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	local tbuff = player.GetBuff(3219, 8)
	local cbuff = player.GetBuff(3220, 8)
	--local zbuff = player.GetBuff(3461, 8)
	local splayer = GetPlayer(dwSkillSrcID)
	local slevel = splayer.nLevel
	local sbuff = player.GetBuff(4907, 4)
	if not tbuff and not cbuff and not zbuff then
		player.AddBuff(dwSkillSrcID, slevel, 3220, 8)
	elseif (cbuff and cbuff.dwSkillSrcID ~= dwSkillSrcID) or tbuff then
		player.AddBuff(dwSkillSrcID, slevel, 4907, 4)
		player.AddBuff(dwSkillSrcID, slevel, 4918, 4)
	end

end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com