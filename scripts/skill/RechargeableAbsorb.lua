---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/RechargeableAbsorb.lua
-- ����ʱ��:	2015/8/3 17:37:35
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function OnAddAbsorbShield(character, dwSkillSrcID)
	--print(22222)
end

--��һ������������Ŀ��Ķ��󣬵ڶ������ͷ��ߵ�ID��һ��ע��,��֮����滻���ᴥ������ű�
function OnRemoveAbsorbShield(character, dwSkillSrcID)
	local target = character

	if not target then
		return
	end
	--[[
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	--]]
	--[[
	--�����Ǵ������÷����Ū��buff
	local buff_meihuasannong = target.GetBuff(9334, 1)
	if buff_meihuasannong then
		print(9)
		local nLeftFrame = buff_meihuasannong.nLeftActiveCount
		if player.GetSkillLevel(14249) == 1 then
			--��������
			target.AddBuff(0, 99, 9337, 1, nLeftFrame)
			print("nLeftFrame"..nLeftFrame)
		else
			--һ���Լ���
			target.AddBuff(0, 99, 9336, 1, nLeftFrame)
			print("nLeftFrame"..nLeftFrame)
		end

	end
	--�������㹻�˺���ǰ��ʧ��������
	if player.GetSkillLevel(14252) == 1 and target.nRechargeableAbsorbShieldValue == 0 then
		local nMax = player.nMaxMana
		local VitaToMana = player.nCurrentVitality * 2.25
		local kungFu_lev = player.GetSkillLevel(10448)
		local nkungmana = {347, 2110, 3148, 4187, 5224, 6262, 7300, 14278, 24378, 33084}
		local nManaBase
		if kungFu_lev ~= 0 then
			nManaBase = nMax - VitaToMana - nkungmana[kungFu_lev]
		else
			nManaBase = nMax - VitaToMana
		end
		print(nManaBase * 1500 / 1024)
		player.nCurrentMana = player.nCurrentMana + nManaBase * 1500 / 1024
	end
	--]]

	--ɾ������buff�����buff
	target.DelBuff(9341, 1)
	target.DelBuff(9342, 1)
	target.DelBuff(9334, 1)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com