------------------------------------------------
-- �ļ���    :  ����_�����¼�_֪����.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  �����¼�
-- ��������  :  ֪����
-- ����Ч��  :  ֪���ε��¼����ܣ�����ʱ�������Թ������ͷ�һ���˺�����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
		{nCostMana=36},
		{nCostMana=58},
		{nCostMana=75},
		{nCostMana=92},
		{nCostMana=109}
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
		local dwSkillLevel	= 5
	
   
	skill.BindBuff(1,535,dwSkillLevel)--��������
    
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);	--����CD1.5��
    skill.SetNormalCoolDown(1, 122);	--����CD90��
	skill.SetCheckCoolDown(1, 444)
		--������λ
		--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
		----------------- ���ü������� ---------------------------------------------------------------------
		--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 219;	-- �������ĵ�����
    --------------- ����������� ----------------------------------------------------------------------
   
    -- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
		-- skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius				= 0;								--����ʩ����С�뾶
    skill.nMaxRadius        = 22 * LENGTH_BASE;						--����ʩ�����뾶
    skill.nAngleRange       = 256; 									--ʩ�ŽǶ�
    
    skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    skill.nBreakRate        = 256;									--����ϵĸ���,Ĭ��1024��ʾһ�������
    
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