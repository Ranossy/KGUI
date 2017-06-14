--������Ե������� ǧ������ һͳ����
--�书����
--��Ʒ���߼���-CDר��
--����Ч����˵���������߼���CDר��
--CBG 2009-09-23

--------------����ķָ���-----------------------------------------------------
tSkillData = 
{
    {nAttraction = 10},
};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	
	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,				-- ��������ģʽ
   		ATTRIBUTE_TYPE.ADD_FELLOWSHIP_ATTRACTION,								-- ħ������
   		tSkillData[dwSkillLevel].nAttraction,							-- ����ֵ1
   		0																-- ����ֵ2
   		);

	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- ��������ģʽ
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
   		"skill/item/item_˫���±�.lua",				-- ����ֵ1
   		0														-- ����ֵ2
   		);
 
  ----------------- ʱ����� -------------------------------------------------
    ----------------- ����Cool down --------------------------------------------
    --CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetPublicCoolDown(16);						-- ����CD 1.5��
    skill.SetNormalCoolDown(1, 216);
    
    skill.nPrepareFrames  	= 80;				-- ����֡��
    --skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
    --skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
    skill.nMaxRadius    = 8 * LENGTH_BASE;
    skill.nAngleRange   = 128; 
    skill.nBrokenRate   = PERCENT_BASE;	
    --����֡��
	skill.nPrepareFrames    = 38;
	          
    return true;
end    

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.AddAchievementCount(600, 1)
	local scene = player.GetScene()
	if scene.dwMapID == 40 and player.nY > 22299 and player.nX > 19229 then
		player.AddAchievementCount(1435, 1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com