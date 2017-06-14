------------------------------------------------
-- �ļ���    :  �칤��_2��BOSS_ƽ��ָ_�Ա�.lua
-- ������    :  ���
-- ����ʱ��  :  2009-3-10
-- ��;(ģ��):  �书����
--����������	90     
--ʩʩ�Ŵ���(�˴�Ĭ��45
--ԤԤ����������Ŀ���?
--������ʱ��(˲��������
--ʩʩ�ŽǶ�(ȫ�Ƕ�256)
--AOAOE����Ŀ�����(��A
--AOAOE�뾶(���24,��AO
--BUBUFFԤ�����в���(ֱ
--BUBUFFÿ�����(ֱ����
--BUBUFF����(ֱ���˺���
--BUBUFF���ɵ��Ӳ���(
--		               
--		               
--		               
--����������˺��ٷֱ�	
--�����γ���ʱ��	30.
--ԤԤ��ʩ�Ŵ���	1.0
--���˺��ٷֱ�	48%    
--�����屬����(��ͨ����
--AOAOE����	2.08       
--���ۺϱ�����	1.68   
--Inǿ��ϵ��	0.33   

------------------------------------------------


--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 1		0-4  
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 2		5-9  
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 3		10-14
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 4		15-19
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 5		20-24
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 6		25-29
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 7		30-34
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 8		35-39
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 9		40-44
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 10		45-49
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 11		50-54
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 12		55-59	                                           
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 13		60-64
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 14		65-69
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 15		70-74
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 16		75-79
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 17		80-84
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 18		85-89
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 19		90-94
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 20		95-99
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
        ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,  				--35��BOSSǿ�ȣ��õڰ˼� 
        0, 
        0
    );

--	skill.BindBuff(1,tSkillData[dwSkillLevel].nDebuffID, tSkillData[dwSkillLevel].nDebuffLevel)

    
    
	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);	--����CD
	--skill.SetNormalCoolDown(1, 151);
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	----------------- ���˴��������� -------------------------------------------------
    skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
    skill.nBrokenRate         = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	--Skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 20 * LENGTH_BASE;		-- ����ʩ�ŵ�������
    skill.nAngleRange       = 256; 									--ʩ�ŽǶ�
    skill.nAreaRadius       = 20 * LENGTH_BASE;
	skill.nPrepareFrames  	= 48;					-- ����֡��
   -- skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	--skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    --skill.nWeaponDamagePercent		= 0;
    skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
	--skill.nTargetCountLimit	= 5;
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(npc, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	local dwNpcLife = npc.nCurrentLife;
	local dwNpcMaxLife = npc.nMaxLife;
    
	if dwNpcLife  <  dwNpcMaxLife*0.1 then
	else
		return false;
	end
    
	return nPreResult;
end


function CanLearnSkill(skill, player)
	return true
end
function Apply(dwCharacterID)
end
function OnSkillLevelUp(skill, player)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com