---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_����ǹ��_��.lua
-- ����ʱ��:	2013/6/5 19:58:34
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���-����ǹ��-��.lua
-- ������    :  ����
-- ����ʱ��  :  2008-05-23 
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����ǹ��
-- ��������  :  ��
-- ����Ч��  :  5�뻯��2���˺�



------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nCostMana = 12, nBuffID = 360, nBuffLevel = 1},
	{nCostMana = 19, nBuffID = 360, nBuffLevel = 2},
	{nCostMana = 24, nBuffID = 360, nBuffLevel = 3},
	{nCostMana = 30, nBuffID = 360, nBuffLevel = 4},
	{nCostMana = 35, nBuffID = 360, nBuffLevel = 5},
	{nCostMana = 40, nBuffID = 360, nBuffLevel = 6},
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		360,
		tSkillData[dwSkillLevel].nBuffLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		614,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/���/���_����ǹ��_��.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	--�����ɶ����3��
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
--		ATTRIBUTE_TYPE.CALL_BUFF,
--		360,
--		tSkillData[dwSkillLevel].nBuffLevel
--	);
	--2009��6��26�ո�Ϊ����1���� CBG

--ʩ�� �����ɵ���_����buff,����������4��
--[[	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		614,
		dwSkillLevel
	);--]]
    
    
--	40����������� ���� 
--	skill.AddAttribute(
--        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
--        ATTRIBUTE_TYPE.CALL_BUFF,
--        tSkillData[dwSkillLevel].nBuffID,
--        tSkillData[dwSkillLevel].nBuffLevel
--    );
	
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 148);
	skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 364;	-- �������ĵ�����
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������

	--skill.nMinRadius		= 0											--����ʩ����С�뾶
	skill.nMaxRadius = 20 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�360��
	--skill.nAreaRadius		= 15 * LENGTH_BASE
    
    
	--skill.nPrepareFrames    = 32;										--����֡��,16֡����1��
    
	--skill.nBulletVelocity   = 12;										--�ӵ��ٶ�,��/֡
    
	--skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
	return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local lv = player.GetSkillLevel(442)
	if player.GetSkillLevel(6528) == 1 and not player.GetBuff(7913,1) and player.dwShapeShiftID == 0 then
		player.AddBuff(dwCharacterID, player.nLevel, 6334, 1, 1)
	end
	--[[
	if player.GetSkillLevel(5684) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6159, 1, 1)
	end
	--]]
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com