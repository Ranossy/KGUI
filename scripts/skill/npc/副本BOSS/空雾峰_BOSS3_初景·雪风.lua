------------------------------------------------
-- �ļ���    : �����_BOSS3_������ѩ��.lua
-- ������    :  �²���
-- ����ʱ��  :  2009-3-10
-- ��;(ģ��):  ����С��
-- �书����  :  �����
-- �书����  :  3��BOSS
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  ��Ѩ����˺�������5��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 64},		--level 1
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 68},		--level 2
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 72},		--level 3
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 76},		--level 4
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 80},		--level 5
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 84},		--level 6
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 88},		--level 7
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 92},		--level 8
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 96},		--level 9
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 100},		--level 10
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 104},		--level 11
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 108},		--level 12
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 112},		--level 13
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 116},		--level 14
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 120},		--level 15
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 124},		--level 16
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 128},		--level 17
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 132},		--level 18
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 136},		--level 19
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 140},		--level 20
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
	
           skill.BindBuff(1,1000,1);		-- ����1��λBuff 
    
	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab

    --skill.SetPublicCoolDown(16);	--����CD
   --skill.SetNormalCoolDown(2, 126);
	
	
    skill.nWeaponDamagePercent = 0;
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
    ----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 5 * LENGTH_BASE;		-- ����ʩ�ŵ������� 


    skill.nAreaRadius        = 6 * LENGTH_BASE;   --����ʩ�ŷ�Χ����
    skill.nAngleRange       = 128;  --ʩ�ŽǶ�
  -- skill.nTargetCountLimit	= 3;	-- �޶�����Ŀ��Ϊ4��
    
   -- skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	--skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
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