------------------------------------------------
-- �ļ���    :  ����_����ж��.lua
-- ������    :  �²���	
-- ����ʱ��  :  2008-8-5
-- ��;(ģ��):  NPC����
-- �书����  :  Ұ��	
-- �书����  :  �⹦
-- �书��·  :  ��
-- ��������  :  ����ж��
-- ����Ч��  :  �⹦����������40�㣬����30�룬��DEBUFF�ɵ���5�㡣
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")


function GetSkillLevelData(skill)

	local bRetCode     = false;
	local dwSkillLevel =skill.dwLevel
	
	skill.BindBuff(1, 580, 1);

	
--	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetNormalCoolDown(1, 1);	--����CD
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana			= 0;
	
    ----------------- ����������� ----------------------------------------------------------------------
--   	skill.AddSlowCheckSelfBuff(10039, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
 
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 0;

	skill.nMinRadius		= 0											--����ʩ����С�뾶
	skill.nMaxRadius        = 4 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange       = 128; 									--ʩ�ŽǶ�
    
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

function OnSkillLevelUp(skill, player)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com