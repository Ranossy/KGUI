---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/�������buff���_�·�����.lua
-- ����ʱ��:	2013/12/5 10:57:59
-- �����û�:	xueyan
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	local tbuff = player.GetBuff(3219, 0)
	local cbuff = player.GetBuff(3220, 0)
	--local zbuff = player.GetBuff(3461, 8)
	local splayer = GetPlayer(dwSkillSrcID)
	local slevel = splayer.nLevel
	local sbuff = player.GetBuff(4907, 0)
	if not tbuff and not cbuff then
		player.AddBuff(dwSkillSrcID, slevel, 3220, 9)
	elseif (cbuff and cbuff.dwSkillSrcID ~= dwSkillSrcID) or tbuff then
		if sbuff and sbuff.nLevel ~= 5 then
			player.DelBuff(4907,sbuff.nLevel)
		end
		player.AddBuff(dwSkillSrcID, slevel, 4907, 5)
		
		if cbuff and cbuff.nLevel ~= 9 then
			player.DelBuff(3220, cbuff.nLevel)
			player.AddBuff(dwSkillSrcID, slevel, 3220, 9)
		end
		
		if tbuff and tbuff.nLevel ~= 9 then
			local nCount = tbuff.nLeftActiveCount
			player.DelBuff(3219, tbuff.nLevel)
			player.AddBuff(0, 99, 3219, 9, nCount)
		end
		
		--player.AddBuff(dwSkillSrcID, slevel, 4918, 4)
	end

end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com