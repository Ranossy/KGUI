------------------------------------------------
-- �ļ���    :  Ӣ��������_2��BOSS_������_�����踫.lua
-- ������    :  CBG
-- ����ʱ��  :  2009-5-13
-- ��;(ģ��):  ����
-- �书����  :  Ӣ��������_2��BOSS_����������
-- �书����  :  
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  ���50%�����HP�˺�
----------------------�͵��ķָ���--------------------------

--------------�ű��ļ���ʼ------------------------------------------------ 

Include("scripts/Include/Skill.lh")                   
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 420 *0.8, nDamageRand = 420 *0.4, nCostMana = 0},		--level 1		  
	{nDamageBase = 711 *0.8, nDamageRand = 711 *0.4, nCostMana = 0},		--level 2		 
	{nDamageBase = 1020 *0.8, nDamageRand = 1020 *0.4, nCostMana = 0},		--level 3		
	{nDamageBase = 1484*0.8, nDamageRand = 1484 *0.4, nCostMana = 0},		--level 4		
	{nDamageBase = 1948*0.8, nDamageRand = 1948*0.4, nCostMana = 0},		--level 5		
	{nDamageBase = 2680*0.8, nDamageRand = 2680*0.4, nCostMana = 0},		--level 6		
	{nDamageBase = 3195*0.8, nDamageRand = 3195*0.4, nCostMana = 0},		--level 7		
	{nDamageBase = 3711*0.8, nDamageRand = 3711*0.4, nCostMana = 0},		--level 8		
	{nDamageBase = 4226*0.8, nDamageRand = 4226*0.4, nCostMana = 0},		--level 9		
	{nDamageBase = 4742*0.8, nDamageRand = 4742*0.4, nCostMana = 0},		--level 10		
	{nDamageBase = 5257*0.8, nDamageRand = 5257*0.4, nCostMana = 0},		--level 11		
	{nDamageBase = 5773*0.8, nDamageRand = 5773*0.4, nCostMana = 0},		--level 12			                                           
	{nDamageBase = 6288*0.8, nDamageRand = 6288*0.4, nCostMana = 0},		--level 13		
	{nDamageBase = 6804*0.8, nDamageRand = 6804*0.4, nCostMana = 0},		--level 14		
	{nDamageBase = 7319*0.8, nDamageRand = 7319*0.4, nCostMana = 0},		--level 15	
	{nDamageBase = 7835*0.8, nDamageRand = 7835*0.4, nCostMana = 0},		--level 16		
	{nDamageBase = 8350*0.8, nDamageRand = 8305*0.4, nCostMana = 0},		--level 17		
	{nDamageBase = 8866*0.8, nDamageRand = 8866*0.4, nCostMana = 0},		--level 18		
	{nDamageBase = 9381*0.8, nDamageRand = 9381*0.4, nCostMana = 0},		--level 19		
	{nDamageBase = 9897*0.8, nDamageRand = 9897*0.4, nCostMana = 0},		--level 20		
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	
	
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,				
        tSkillData[dwSkillLevel].nDamageBase * 0.14 * 0.7, 
        0
    );

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
        tSkillData[dwSkillLevel].nDamageRand * 0.14 * 0.7, 
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
    skill.nMaxRadius        = 20 * LENGTH_BASE;		-- ����ʩ�ŵ�������
    skill.nAngleRange       = 256; 									--ʩ�ŽǶ�
    skill.nAreaRadius       = 10 * LENGTH_BASE;
    skill.nTargetCountLimit	= 10;

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