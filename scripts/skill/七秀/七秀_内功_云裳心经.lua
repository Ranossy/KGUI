---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_�ڹ�_�����ľ�.lua
-- ����ʱ��:	2013/9/6 9:53:10
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������    :  �º���	
-- ����ʱ��  :  2007-8-28
-- ����Ч��  :  �����ڹ�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{DecriticalDamagePowerBase = 13, nDodge = 2, nManaAdd = 348, nTherapy = 100, nManaReplenish = 1, nMagicDefence = 1},
	{DecriticalDamagePowerBase = 22, nDodge = 3, nManaAdd = 2121, nTherapy = 200, nManaReplenish = 2, nMagicDefence = 3},
	{DecriticalDamagePowerBase = 35, nDodge = 5, nManaAdd = 3164, nTherapy = 300, nManaReplenish = 2, nMagicDefence = 5},
	{DecriticalDamagePowerBase = 47, nDodge = 7, nManaAdd = 4208, nTherapy = 400, nManaReplenish = 3, nMagicDefence = 6},
	{DecriticalDamagePowerBase = 60, nDodge = 9, nManaAdd = 5251, nTherapy = 500, nManaReplenish = 4, nMagicDefence = 8},
	{DecriticalDamagePowerBase = 72, nDodge = 11, nManaAdd = 6294, nTherapy = 600, nManaReplenish = 5, nMagicDefence = 10},
	{DecriticalDamagePowerBase = 85, nDodge = 13, nManaAdd = 7337, nTherapy = 700, nManaReplenish = 5, nMagicDefence = 12},
	{DecriticalDamagePowerBase = 98, nDodge = 15, nManaAdd = 14350, nTherapy = 800, nManaReplenish = 6, nMagicDefence = 14},
	{DecriticalDamagePowerBase = 110, nDodge = 17, nManaAdd = 24500, nTherapy = 900, nManaReplenish = 7, nMagicDefence = 15},
	{DecriticalDamagePowerBase = 244, nDodge = 38, nManaAdd = 33251, nTherapy = 1400, nManaReplenish = 7, nMagicDefence = 35},
}

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	--���� ����-����AP �ӳ�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1711,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.DROP_DEFENCE,
		250,
		0       
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- Ϊ�˵������apply�����ٰ�����ű�����һ�顣
		"skill/����/����_�ڹ�_�����ľ�.lua",
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		680,
		2
	);	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		681,
		2
	);	
	--����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.DECRITICAL_DAMAGE_POWER_BASE,
		tSkillData[dwSkillLevel].DecriticalDamagePowerBase,
		0
		);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH,
		tSkillData[dwSkillLevel].nManaAdd / 240,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH_EXT,
		tSkillData[dwSkillLevel].nManaAdd / 1200,
		0
		);
	--�����������
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_THERAPY_POWER_COF,
		1741,
		0
		);
	--���Ƕ�����߻���
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_LUNAR_CRITICAL_STRIKE_COF,
		62,
		0
		);
	--���Ƕ�����߻�Ц
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_LUNAR_CRITICAL_DAMAGE_POWER_COF,
		21,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.BEAT_BACK_RATE,
		-819,
		0
	);
	--���ʼ�������
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_MAX_MANA_COF,
		2304,
		0
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --��������
		ATTRIBUTE_TYPE.MAX_LIFE_PERCENT_ADD,
		(dwSkillLevel * 1 + 10) / 100 * 1024,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_MANA_BASE,
		tSkillData[dwSkillLevel].nManaAdd,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.DODGE,
		tSkillData[dwSkillLevel].nDodge,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.THERAPY_POWER_BASE,
		tSkillData[dwSkillLevel].nTherapy,
		0
	);	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAGIC_SHIELD, --  �ڹ�����ֵ
		tSkillData[dwSkillLevel].nMagicDefence,
		0
	);  
 
	--���̽÷���ƻ����������¼�  2011-12-8
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		639,
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		640,
		0
	);
 
	--[[ skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,          --Ĭ�����ԣ����⹦�˺�10%����509-397BUFF����
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		103,
		0
	);--]]
	--[[ if dwSkillLevel >= 3 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,          --30������ ������Ѫ
			ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
			259,
			0
		);
	end--]]
	-- 40���������ڽ���buff��

	-- 50������������صͰ�������
	
	-- 60�����������Ĺ��Ҽ�����

	-- 70���������ڷ���Ͱ���
    	
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetNormalCoolDown(1, 157);
	--skill.SetNormalCoolDown(2, 152);
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= 0;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	--skill.nMinRadius		= 0											--����ʩ����С�뾶
	--skill.nMaxRadius        = 2 * LENGTH_BASE;							--����ʩ�����뾶
	--skill.nAngleRange       = 128; 										--ʩ�ŽǶ�
    
	--skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
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
	local MountKf = player.GetKungfuMount();
	if not MountKf then
		player.MountKungfu(skill.dwSkillID, skill.dwLevel)
	end
	
	local dwSkillLevel = skill.dwLevel;
	if player.dwForceID == 5 and player.GetSkillLevel(10200) < 1 then		--ѧϰ������·
		player.LearnSkill(10200)
	end
	--player.LearnSkill(536);
	player.LearnSkillLevel(536, dwSkillLevel, player.dwID)
	player.LearnSkill(538);
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)	
	if player then
		player.AddBuff(player.dwID, player.nLevel, 6176, 2)
		player.SetTimer(16,"scripts/skill/����/����_�ڹ�_�����ľ�.lua",0,0)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.DelBuff(6176, 2)
	end
end

function OnTimer(player, nparam1, nparam2)
	if not player then
		return
	end
		if player.IsFormationLeader() then
		player.CastSkill(526,1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com