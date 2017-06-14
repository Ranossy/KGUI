---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_��ˮ����_ƽ������.lua
-- ����ʱ��:	2013/5/12 14:13:47
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_��ˮ����_ƽ������.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2010-01-27
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ��ˮ����
-- ��������  :  ������
-- ����Ч��  :  ƽ�����£�һ������ˮ�棬���±����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 15, nCostRage = 0, nDamageBase = 70, 		nDamageRand = 3}, -- Level 1 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 77, 		nDamageRand = 4}, -- Level 2 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 84, 		nDamageRand = 4}, -- Level 3 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 91, 		nDamageRand = 5}, -- Level 4 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 98, 		nDamageRand = 6}, -- Level 5 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 100, 		nDamageRand = 7}, -- Level 6 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 105, 		nDamageRand = 7}, -- Level 7 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 110, 		nDamageRand = 8}, -- Level 8 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 112, 		nDamageRand = 9}, -- Level 9 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 114, 		nDamageRand = 9}, -- Level 10 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 116, 		nDamageRand = 10},   	-- Level 11
	{nAddRage = 15, nCostRage = 0, nDamageBase = 118, 		nDamageRand = 11}, -- Level 12
	{nAddRage = 15, nCostRage = 0, nDamageBase = 120, 	nDamageRand = 11}, -- Level 13
	{nAddRage = 15, nCostRage = 0, nDamageBase = 122, 	nDamageRand = 12}, -- Level 14
	{nAddRage = 15, nCostRage = 0, nDamageBase = 124, 	nDamageRand = 13}, -- Level 15
	{nAddRage = 15, nCostRage = 0, nDamageBase = 125, 	nDamageRand = 14}, -- Level 16
	{nAddRage = 15, nCostRage = 0, nDamageBase = 132, 	nDamageRand = 14}, -- Level 17
	{nAddRage = 15, nCostRage = 0, nDamageBase = 139, 	nDamageRand = 15}, -- Level 18
	{nAddRage = 15, nCostRage = 0, nDamageBase = 146, 	nDamageRand = 16}, -- Level 19
	{nAddRage = 15, nCostRage = 0, nDamageBase = 153, 	nDamageRand = 16}, -- Level 20
	{nAddRage = 15, nCostRage = 0, nDamageBase = 160, 	nDamageRand = 17}, -- Level 21
	{nAddRage = 15, nCostRage = 0, nDamageBase = 167, 	nDamageRand = 18}, -- Level 22
	{nAddRage = 15, nCostRage = 0, nDamageBase = 174, 	nDamageRand = 18}, -- Level 23
	{nAddRage = 15, nCostRage = 0, nDamageBase = 181, 	nDamageRand = 19}, -- Level 24 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 188, 	nDamageRand = 20}, -- Level 25
	{nAddRage = 15, nCostRage = 0, nDamageBase = 195, 	nDamageRand = 21}, -- Level 26
};           
             

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	--������ĳ�̼��ܱ��buff����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		7795,
		1
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CURRENT_RAGE,
		tSkillData[dwSkillLevel].nAddRage,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH_TO_DST_BACK,
		60,
		0
		);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		13470,
		dwSkillLevel
	);
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		1687,
		2
	);--��ӻ�����������Buff
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/�ؽ�/�ؽ�_��ˮ����_ƽ������.lua", -- ����ֵ1
		0														-- ����ֵ2
		);
	--��ħ�Ƽ�Ч��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/�ؽ�/90����Ѩ/ƽ�������Ƽ�Ч��.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		
	skill.SetNormalCoolDown(1, 355);
	skill.SetCheckCoolDown(1, 444);
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 11 then
		skill.nChannelInterval = 16;
	elseif dwSkillLevel < 26 then
		skill.nChannelInterval = 16 + (dwSkillLevel -10) * 2
	else
		skill.nChannelInterval = 48;     -- ͨ�������ʱ��   
	end
	--skill.nChannelInterval = 48;
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 8 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	skill.nWeaponDamagePercent = 1024;
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
		player.AcquireAchievement(1359)
	end
end

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--player.AddBuff(dwCharacterID, player.nLevel, 5890, 1, 1)
	--[[
	if player.GetSkillLevel(5952) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 5727, 1, 1)
	end
	--]]
end
--
--function UnApply(dwCharacterID)
--end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com