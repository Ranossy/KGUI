------------------------------------------------
-- �ļ���    :  Ӣ��������_1��BOSS_����_�ӷ���.lua
-- ������    :  ������
-- ����ʱ��  :  2009-5-13
-- ��;(ģ��):  ����
-- �书����  :  Ӣ��������_1��BOSS_���Լ���
-- �书����  :  
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  ����Χ�˺�15%���HP
----------------------�͵��ķָ���--------------------------

--------------�ű��ļ���ʼ------------------------------------------------ 

Include("scripts/Include/Skill.lh")                   
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 184  *0.8, nDamageRand = 184  *0.4, nCostMana = 0},		--level 1		  
	{nDamageBase = 312  *0.8, nDamageRand = 312  *0.4, nCostMana = 0},		--level 2		 
	{nDamageBase = 448  *0.8, nDamageRand = 448  *0.4, nCostMana = 0},		--level 3		
	{nDamageBase = 652  *0.8, nDamageRand = 652  *0.4, nCostMana = 0},		--level 4		
	{nDamageBase = 856  *0.8, nDamageRand = 856  *0.4, nCostMana = 0},		--level 5		
	{nDamageBase = 1178 *0.8, nDamageRand = 1178 *0.4, nCostMana = 0},		--level 6		
	{nDamageBase = 1404 *0.8, nDamageRand = 1404 *0.4, nCostMana = 0},		--level 7		
	{nDamageBase = 1631 *0.8, nDamageRand = 1631 *0.4, nCostMana = 0},		--level 8		
	{nDamageBase = 1857 *0.8, nDamageRand = 1857 *0.4, nCostMana = 0},		--level 9		
	{nDamageBase = 2084 *0.8, nDamageRand = 2084 *0.4, nCostMana = 0},		--level 10		
	{nDamageBase = 2311 *0.8, nDamageRand = 2311 *0.4, nCostMana = 0},		--level 11		
	{nDamageBase = 2537 *0.8, nDamageRand = 2537 *0.4, nCostMana = 0},		--level 12			                                           
	{nDamageBase = 2764 *0.8, nDamageRand = 2764 *0.4, nCostMana = 0},		--level 13		
	{nDamageBase = 2990 *0.8, nDamageRand = 2990 *0.4, nCostMana = 0},		--level 14		
	{nDamageBase = 3217 *0.8, nDamageRand = 3217 *0.4, nCostMana = 0},		--level 15	
	{nDamageBase = 3443 *0.8, nDamageRand = 3443 *0.4, nCostMana = 0},		--level 16		
	{nDamageBase = 3670 *0.8, nDamageRand = 3670 *0.4, nCostMana = 0},		--level 17		
	{nDamageBase = 3897 *0.8, nDamageRand = 3897 *0.4, nCostMana = 0},		--level 18		
	{nDamageBase = 4123 *0.8, nDamageRand = 4123 *0.4, nCostMana = 0},		--level 19		
	{nDamageBase = 4350 *0.8, nDamageRand = 4350 *0.4, nCostMana = 0},		--level 20		
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode    = false;
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
    skill.nMaxRadius        = 5 * LENGTH_BASE;		-- ����ʩ�ŵ�������
    skill.nAngleRange       = 256; 									--ʩ�ŽǶ�
    skill.nAreaRadius       = 35 * LENGTH_BASE;
	skill.nTargetCountLimit	= 10;		--ʩ������
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