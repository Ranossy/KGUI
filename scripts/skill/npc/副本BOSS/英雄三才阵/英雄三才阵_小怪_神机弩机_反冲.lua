------------------------------------------------
-- �ļ���    :  Ӣ��������_С��_������_����.lua
-- ������    :  CBG
-- ����ʱ��  :  2009-6-29
-- ��;(ģ��):  �书����


Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 119  *0.95, nDamageRand = 119  *0.1, nCostMana = 38},		--level 1		0-4  
	{nDamageBase = 201  *0.95, nDamageRand = 201  *0.1, nCostMana = 38},		--level 2		5-9  
	{nDamageBase = 288  *0.95, nDamageRand = 288  *0.1, nCostMana = 38},		--level 3		10-14
	{nDamageBase = 419  *0.95, nDamageRand = 419  *0.1, nCostMana = 38},		--level 4		15-19
	{nDamageBase = 550  *0.95, nDamageRand = 550  *0.1, nCostMana = 38},		--level 5		20-24
	{nDamageBase = 757  *0.95, nDamageRand = 757  *0.1, nCostMana = 38},		--level 6		25-29
	{nDamageBase = 903  *0.95, nDamageRand = 903  *0.1, nCostMana = 38},		--level 7		30-34
	{nDamageBase = 1048 *0.95, nDamageRand = 1048 *0.1, nCostMana = 38},		--level 8		35-39
	{nDamageBase = 1194 *0.95, nDamageRand = 1194 *0.1, nCostMana = 38},		--level 9		40-44
	{nDamageBase = 1340 *0.95, nDamageRand = 1340 *0.1, nCostMana = 38},		--level 10		45-49
	{nDamageBase = 1485 *0.95, nDamageRand = 1485 *0.1, nCostMana = 38},		--level 11		50-54
	{nDamageBase = 1631 *0.95, nDamageRand = 1631 *0.1, nCostMana = 38},		--level 12		55-59	                                           
	{nDamageBase = 1777 *0.95, nDamageRand = 1777 *0.1, nCostMana = 38},		--level 13		60-64
	{nDamageBase = 1922 *0.95, nDamageRand = 1922 *0.1, nCostMana = 38},		--level 14		65-69
	{nDamageBase = 2068 *0.95, nDamageRand = 2068 *0.1, nCostMana = 38},		--level 15		70-74
	{nDamageBase = 2214 *0.95, nDamageRand = 2214 *0.1, nCostMana = 38},		--level 16		75-79
	{nDamageBase = 2359 *0.95, nDamageRand = 2359 *0.1, nCostMana = 38},		--level 17		80-84
	{nDamageBase = 2505 *0.95, nDamageRand = 2505 *0.1, nCostMana = 38},		--level 18		85-89
	{nDamageBase = 2651 *0.95, nDamageRand = 2651 *0.1, nCostMana = 38},		--level 19		90-94
	{nDamageBase = 2796 *0.95, nDamageRand = 2796 *0.1, nCostMana = 38},		--level 20		95-99
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
    skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_KNOCKED_DOWN,  				--����5��
		72,
		0
	);
	skill.BindBuff(1,994,5)

    
    
	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);	--����CD
	--skill.SetNormalCoolDown(1, 151);
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 30 * LENGTH_BASE;		-- ����ʩ�ŵ�������
    skill.nAngleRange       = 256; 									--ʩ�ŽǶ�
    skill.nAreaRadius       = 4 * LENGTH_BASE;

   -- skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	--skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    --skill.nWeaponDamagePercent		= 0;
    --skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
	--skill.nTargetCountLimit	= 5;
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