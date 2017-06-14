------------------------------------------------
-- �ļ���    :  ����_Τ������.lua
-- ������    :  ����	
-- ����ʱ��  :  9367-6-21
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ����
-- ��������  :  Τ������
-- ����Ч��  :  ǰ����Χ�˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 1		0-4
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 2		5-9
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 3		10-14
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 4		15-19
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 5		20-24
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 6		25-29
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 7		30-34
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 8		35-39
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 9		40-44
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 10		45-49
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 11		50-54
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 12		55-59
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 13		60-64
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 14		65-69
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 15		70-74
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 16		75-79
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 17		80-84
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 18		85-89
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 19		90-94
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 20		95-99	
};



--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
        tSkillData[dwSkillLevel].nDamageBase * 0.14, 
        0
    );

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
        tSkillData[dwSkillLevel].nDamageRand * 0.14, 
        0
    );

    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
        0, 
        0
    );

    
	skill.BindBuff(1,770,1);
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
   -- skill.SetPublicCoolDown(16);	--����CD
	--  skill.SetNormalCoolDown(2, 65);
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 5 * LENGTH_BASE;						--����ʩ�����뾶
    skill.nAngleRange       = 85; 								--ʩ�ŽǶ�
    skill.nAreaRadius		= 5 * LENGTH_BASE;
    skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com