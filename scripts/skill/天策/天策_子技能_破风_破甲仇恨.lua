------------------------------------------------
-- �ļ���    :  ���_�Ӽ���_�Ʒ�_�Ƽ�.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-6-19
-- ��;(ģ��):  �书����
-- �书����  :  ���	
-- �书����  :  �⹦
-- �书��·  :  ��
-- ��������  :  �Ʒ��Ӽ���
-- ����Ч��  :  װ����������,�ڼ���buff���ڵ�ʱ��,�Ʒ������ü��Ͷ�Ŀ������Ƽ�Ч��,
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nThreat = 265},		-- Level 1
	{nThreat = 325},		-- Level 2
	{nThreat = 385},		-- Level 3
	{nThreat = 445},		-- Level 4
	{nThreat = 505},		-- Level 5
	{nThreat = 565},		-- Level 6
	{nThreat = 625},		-- Level 7
	{nThreat = 685},		-- Level 8
	{nThreat = 745},		-- Level 9
	{nThreat = 805},		-- Level 10
	{nThreat = 865},		-- Level 11
	{nThreat = 925}, 		-- Level 12
	{nThreat = 985}, 		-- Level 13
	{nThreat = 1045},		-- Level 14
	{nThreat = 1105},		-- Level 15
	{nThreat = 1165},		-- Level 16
	{nThreat = 1225},		-- Level 17
	{nThreat = 1285},		-- Level 18
	{nThreat = 1345},		-- Level 19
	{nThreat = 1405},		-- Level 20
	{nThreat = 1465},		-- Level 21
	{nThreat = 1525},		-- Level 22
	{nThreat = 1585},		-- Level 23
	{nThreat = 1645},		-- Level 24
	{nThreat = 1705}, 		-- Level 25
};                 
                   
                   
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
                   
	local bRetCode     = false;
	local dwSkillLevel =skill.dwLevel
	               

	skill.BindBuff(1,552,dwSkillLevel);

    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);	--����CD
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ܳ�� -------------------------------------------------
	skill.nBaseThreat		= tSkillData[dwSkillLevel].nThreat;
	
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana			= 0;
	
    ----------------- ����������� ----------------------------------------------------------------------
	--skill.AddSlowCheckSelfBuff(10039, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
 
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius		= 0											--����ʩ����С�뾶
	skill.nMaxRadius        = 4 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange       = 128; 									--ʩ�ŽǶ�
    
	skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
    
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
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com