---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_��ˮ����_��Ȫ����.lua
-- ����ʱ��:	2013/8/21 14:31:31
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_��ˮ����_��Ȫ����.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2010-01-27
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ��ˮ����
-- ��������  :  ��Ȫ����
-- ����Ч��  :  һ���������Σ��μ��ϻ����ܣ�����֮����Ȫӿ������������Ȫ
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 8, nDamageRand = 1}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 9, nDamageRand = 1}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 10, nDamageRand = 1}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 11, nDamageRand = 1}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 12, nDamageRand = 1}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 13, nDamageRand = 1}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 14, nDamageRand = 2}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 15, nDamageRand = 2}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 16, nDamageRand = 2}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 17, nDamageRand = 2}, -- Level 10 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 18, nDamageRand = 2}, -- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 19, nDamageRand = 2}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 20, nDamageRand = 2}, -- Level 13
};           
             
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		1802,
		1
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/�ؽ�/�ؽ�_��ˮ����_��Ȫ����.lua",
		0
	);
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
--		tSkillData[dwSkillLevel].nDamage, 
--		0
--	);
--
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
--		tSkillData[dwSkillLevel].nDamageRand, 
--		0
--	);
    
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
--		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
--		0, 
--		0
--	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		1702,
		1
	);  --��Ȫ���ܻ���������Buff
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1591,   
		dwSkillLevel
	); --��Ȫ����ѭ��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		1686,
		1
	); --�����л�
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		1783,
--		1
--	);
-- 	skill.BindBuff(1,1702,1) --�������õ�����BUFF

	skill.AddAttribute(														--2010.05.09���70���似��
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3085,
		1
	);	
	
	skill.AddAttribute(														--2010.07.12 70����
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1941,
		1
	);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		
	skill.SetNormalCoolDown(1, 336);
	skill.SetCheckCoolDown(1, 444);
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	--skill.nChannelInterval	= 32;
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 15 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	skill.nWeaponDamagePercent = 0;
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
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
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(1360)
	end
end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--[[
	if player.GetSkillLevel(6544) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 1802, 2, 1)
	end
	--]]
	if player.IsSkillRecipeActive(1578, 1) then
		player.AddBuff(dwCharacterID, player.nLevel, 6547, 1, 1)
	end
	
	--���⡢������Ѩ����Ч��
	if player.GetSkillLevel(5957) == 1 then
		if player.GetSkillLevel(6544) == 1 then
			player.AddBuff(dwCharacterID, player.nLevel, 1802, 1)
		end
	else
		if player.GetSkillLevel(6544) == 1 then
			player.AddBuff(dwCharacterID, player.nLevel, 1802, 2)
		else
			player.AddBuff(dwCharacterID, player.nLevel, 1802, 1)
		end
	end

	--�������
	player.AddBuff(dwCharacterID,player.nLevel,7699,1)
	--[[
	--������Ѩ��ӻ���Ч��
	if player.GetSkillLevel(5957) ~= 1 then
		player.AddBuff(dwCharacterID,player.nLevel,7699,1)
	end
	--]]
	ModityCDToUI(player, 1589, 0, 0)
end
--
--function UnApply(dwCharacterID)
--end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com