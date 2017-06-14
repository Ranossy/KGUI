---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��ڤ����_̫���޼�.lua
-- ����ʱ��:	2013/6/22 17:54:20
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��ڤ����_̫���޼�.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ��ڤ����
-- ��������  :  ̫���޼�
-- ����Ч��  :  �����˺�����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 20, nDamageRand = 2}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 84, nDamageRand = 4}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 98, nDamageRand = 5}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 112, nDamageRand = 6}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 126, nDamageRand = 8}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 140, nDamageRand = 9}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 154, nDamageRand = 11}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 168, nDamageRand = 12}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 182, nDamageRand = 13}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 196, nDamageRand = 15}, -- Level 10 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 210, nDamageRand = 16}, -- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 224, nDamageRand = 18}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 238, nDamageRand = 19}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 252, nDamageRand = 20}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 266, nDamageRand = 22}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 280, nDamageRand = 23}, -- Level 16
	{nAddRage = 0, nCostRage = 0, nDamageBase = 294, nDamageRand = 25}, -- Level 17
	{nAddRage = 0, nCostRage = 0, nDamageBase = 308, nDamageRand = 26}, -- Level 18
	{nAddRage = 0, nCostRage = 0, nDamageBase = 322, nDamageRand = 27}, -- Level 19
	{nAddRage = 0, nCostRage = 0, nDamageBase = 336, nDamageRand = 29}, -- Level 20
	{nAddRage = 0, nCostRage = 0, nDamageBase = 350, nDamageRand = 30}, -- Level 21
	{nAddRage = 0, nCostRage = 0, nDamageBase = 364, nDamageRand = 32}, -- Level 22
	{nAddRage = 0, nCostRage = 0, nDamageBase = 378, nDamageRand = 33}, -- Level 23
	{nAddRage = 0, nCostRage = 0, nDamageBase = 392, nDamageRand = 34}, -- Level 24 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 406, nDamageRand = 36}, -- Level 25
	{nAddRage = 0, nCostRage = 0, nDamageBase = 420, nDamageRand = 37}, -- Level 26
	{nAddRage = 0, nCostRage = 0, nDamageBase = 434, nDamageRand = 39}, -- Level 27 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 448, nDamageRand = 40}, -- Level 28 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 462, nDamageRand = 41}, -- Level 29 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 476, nDamageRand = 43}, -- Level 30
	{nAddRage = 0, nCostRage = 0, nDamageBase = 490, nDamageRand = 44}, -- Level 31
	{nAddRage = 0, nCostRage = 0, nDamageBase = 504, nDamageRand = 46}, -- Level 32
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	
	--skill.AddAttribute(						--��ͨ����˺�
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
	--2329,
	--dwSkillLevel
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/��ڤ����_̫���޼�.lua", -- ����ֵ1
		0															-- ����ֵ2
	);
	
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2337, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);			-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);	-- ����CD
	skill.SetCheckCoolDown(1, 444);
	--skill.SetNormalCoolDown(1, 16);	--����CD
	skill.SetNormalCoolDown(1, 608);	--����CD
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 265*0.2;		-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 265 * 0.4;		-- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 265 * 0.6;		-- �������ĵ�����
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 265*0.8;		-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 265;		-- �������ĵ�����
	end
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 20 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 128; 									--ʩ�ŽǶ�
    
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
       
	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(3832)
	end
end

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local lv = player.GetSkillLevel(306)
	
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	--����Ч��
	if player.GetSkillLevel(5843) == 1 then
		player.AddBuff(player.dwID,player.nLevel,7709,1)
	end


	if lv == 0 then
		return
	end
	--��ͨû���²���
	player.CastSkill(2329, lv)
	
	--����û���²���
	player.CastSkill(2299, lv)
	--[[
	--��ͨ����������һ��
	player.CastSkill(6864, lv)
	
	--��������������һ��
	player.CastSkill(6917, lv)

	--��ͨ���������߶���
	player.CastSkill(9031, lv)
	
	--�������������߶���
	player.CastSkill(9033, lv)
	
	--��ͨ��������������
	player.CastSkill(9032, lv)
	
	--������������������
	player.CastSkill(9034, lv)
	--]]
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com