------------------------------------------------
-- �ļ���    :  �����_С�ּ���_��.lua
-- ������    :  �²���
-- ����ʱ��  :  2009-3-10
-- ��;(ģ��):  ����
-- �书����  :  �����С�ּ���
-- �书����  :  
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  �⹦�˺�����20%
----------------------�����ķָ���--------------------------


--------------�����Ǽ���----------------------------------------------------


Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 1 },		--level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 2 },		--level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 3 },		--level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 4 },		--level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 5 },		--level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 6 },		--level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 7 },		--level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 8 },		--level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 9 },		--level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 10},		--level 10
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 11},		--level 11
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 12},		--level 12
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 13},		--level 13
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 14},		--level 14
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 15},		--level 15
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 16 },		--level 16
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 17 },		--level 17
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 18 },		--level 18
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 19 },		--level 19
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 20},		--level 20	
};
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;

           skill.BindBuff(1,977,1);		-- ����1��λBuff 

    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;

    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    --skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 5 * LENGTH_BASE;							--����ʩ�����뾶
    skill.nAngleRange       = 256; 										--ʩ�ŽǶ�
    --skill.nAreaRadius 		= 15 * LENGTH_BASE;							--���÷�Χ
    --skill.nTargetCountLimit	= 10;			                                                      -- ��������Ŀ����������
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
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com