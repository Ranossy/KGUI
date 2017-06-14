---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/������_�¹�����.lua
-- ����ʱ��:	2013/4/22 16:34:03
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ������_�¹�����.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  �޼���
-- ��������  :  �¹�����
-- ����Ч��  :  ����ɫ�ܵ�����ʱ�������Զ�����Ŀ�ꡣ
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nBuffID = 136, nBuffLevel = 1, nCostMana = 98}, --level 1         
	{nBuffID = 136, nBuffLevel = 2, nCostMana = 128}, --level 2         
	{nBuffID = 136, nBuffLevel = 3, nCostMana = 158}, --level 3         
	{nBuffID = 136, nBuffLevel = 4, nCostMana = 189}, --level 4         
	{nBuffID = 136, nBuffLevel = 5, nCostMana = 219}, --level 5         
	{nBuffID = 136, nBuffLevel = 6, nCostMana = 249}, --level 6          
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	
	skill.BindBuff(1, 136, 6)
	skill.BindBuff(3, 1241, 2, false, 20);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);	--����CD
	skill.SetNormalCoolDown(1, 245);	
	skill.SetCheckCoolDown(1, 444);
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 221;	-- �������ĵ�����
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 4 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 256; 									--ʩ�ŽǶ�
    
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	--skill.nBreakRate        = 1024;									--��ϵĸ���,Ĭ��1024��ʾһ�����
       
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